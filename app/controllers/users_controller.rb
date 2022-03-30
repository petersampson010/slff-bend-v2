class UsersController < ApplicationController
    include HelperModule
    # before_create :confirmation_token
    skip_before_action :authenticate_request, only: [:create, :sign_in, :index, :confirm_email]

    def index
        puts request.headers["Authorization"]
        users = User.all
        render json: find_from_params(users, user_params)
    end 

    def create
        @user = User.new(user_params)
        confirmation_token(@user)
        if @user.save
            NotifierMailer.registration_confirmation(@user).deliver_now
            puts "Please confirm your email address to continue"
            token = jwt_encode({user_id: @user.user_id})
            render json: {user: @user, token: token}
        else
            puts "Ooooppss, something went wrong!"
            render json: @user.errors.full_messages
        end 
    end 

    def sign_in 
        puts 'signing user in'
        @user = User.find_by_email(user_params[:email])
        puts @user
        puts 'user above'
        if @user 
            if @user.authenticate(user_params[:password])
                puts 'authenticated'
                token = jwt_encode({user_id: @user.user_id})
                puts token;
                render json: {user: @user, token: token}
            else 
                render json: {errors: ['Incorrect Password']}
            end 
        else 
            render json: {errors: ['Incorrect Email']}
        end 
    end

    def update
        @user = User.find(params[:id])
        if @user.update(user_params)
            render json: @user
        else 
            render json: @user.errors.full_messages
        end 
    end

    def destroy 
        @user = User.find(params[:id])
        if @user.delete
        else
            render json: @user.errors.full_messages
        end 
    end 

    def total_points 
        user = User.find(params[:id])
        user_gameweek_joiners = user.user_gameweek_joiners
        total_points = user_gameweek_joiners.map{|ug| ug.total_points}.sum
        render json: total_points
    end

    def confirm_email
        user = User.find_by_confirm_token(params[:id])
        if user
          user.email_activate
          render json: 'Thank you for confirming your email. Please go back to App.'
          puts "Welcome to the Sample App! Your email has been confirmed.
          Please sign in to continue."
        else
            render json: "Sorry. User does not exist"
        end
    end

    private 

    attr_accessor :password

    def confirmation_token(user)
        if user.confirm_token.blank?
            user.confirm_token = SecureRandom.urlsafe_base64.to_s
        end
    end

    def user_params 
        params.permit(:user_id, :email, :team_name, :password, :password_confirmation, :transfers, :budget, :gw_start, :admin_user_id)
    end 

end
