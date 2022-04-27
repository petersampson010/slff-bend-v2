class AdminUsersController < ApplicationController
    include HelperModule
    skip_before_action :authenticate_request, only: [:create, :index, :sign_in, :confirm_email]
    
    # make unaccessible for production and creeate a show so specific AU can be accessed
        def index 
            admin_users = AdminUser.all
            render json: find_from_params(admin_users, admin_user_params)
        end 
    
        def create
            @admin_user = AdminUser.new(admin_user_params)
            confirmation_token(@admin_user)
            if @admin_user.save
                if ENV["SET_MAIL"]
                    NotifierMailer.au_registration_confirmation(@admin_user).deliver_now
                end
                token = jwt_encode({admin_user_id: @admin_user.admin_user_id})
                render json: {admin_user: @admin_user, token: token}
            else
                puts @admin_user.errors.full_messages
                render json: @admin_user.errors.full_messages
            end 
        end 
    
        def sign_in 
            puts params
            puts admin_user_params
            @admin_user = AdminUser.find_by_email(admin_user_params[:email])
            if @admin_user
                if @admin_user.admin_user_id === @current_user.admin_user_id
                    if @admin_user.authenticate(admin_user_params[:password])
                        token = jwt_encode({admin_user_id: @admin_user.admin_user_id})
                        render json: {admin_user: @admin_user, token: token}
                    else 
                        render json: 'Incorrect Password'
                    end 
                else 
                    render json: "Token not matching user"
                end 
            else
                render json: 'Incorrect Email'
            end 
        end
    
        def destroy 
            admin_user = AdminUser.find(params[:id])
            admin_user.delete
            admin_users = AdminUser.all
            render json: admin_users
        end 
    
        def league 
            admin_user = AdminUser.find(params[:id])
            users = admin_user.users
            user_gameweek_joiners = UserGameweekJoiner.all
            return_array = []
            users.each do |u|
                ug_joiners = u.user_gameweek_joiners
                total_points = 0
                ug_joiners.each do |ug|
                    total_points = total_points + ug.total_points
                end 
                if ug_joiners.length()>0
                    return_array << {
                        user_id: u.user_id,
                        team_name: u.team_name,
                        total_points: total_points,
                        gw_points: ug_joiners[-1].total_points
                    }
                else 
                    return_array << {
                        user_id: u.user_id,
                        team_name: u.team_name,
                        total_points: 0,
                        gw_points: 0
                    }
                end 
            end
            render json: return_array
        end 
    
        def confirm_email
            admin_user = AdminUser.find_by_confirm_token(params[:id])
            puts AdminUser.all
            puts admin_user
            if admin_user
              admin_user.email_activate
              render json: 'Thank you for confirming your email. Please go back to App.'
              puts "Welcome to the Sample App! Your email has been confirmed.
              Please sign in to continue."
            else
                render json: "Sorry. User does not exist"
            end
        end
    
        private 
    
        def confirmation_token(admin_user)
            if admin_user.confirm_token.blank?
                admin_user.confirm_token = SecureRandom.urlsafe_base64.to_s
            end
        end
    
        def admin_user_params 
            params.permit(:admin_user_id, :email, :password, :club_name)
        end 
    
    
    
    end