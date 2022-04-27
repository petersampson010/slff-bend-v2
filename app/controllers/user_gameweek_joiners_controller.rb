class UserGameweekJoinersController < ApplicationController
    include HelperModule  
    skip_before_action :authenticate_request, only: [:index]
    
    
        def index
            ug_joiners = UserGameweekJoiner.all
            render json: find_from_params(ug_joiners, ug_joiner_params)
        end 
    
        def create
            @user_gameweek_joiner = UserGameweekJoiner.new(ug_joiner_params)
            if @user_gameweek_joiner.save
                render json: @user_gameweek_joiner
            else 
                render json: @user_gameweek_joiner.errors.full_messages
            end 
        end 
    
        # def update
        #     @user_gameweek_joiner = UserGameweekJoiner.find(params[:id])
        #     if @user_gameweek_joiner.update(ug_joiner_params)
        #         render json: @user_gameweek_joiner
        #     else
        #         render json: @user_gameweek_joiner.errors.full_messages
        #     end
        # end
    
        def destroy 
            @user_gameweek_joiner = UserGameweekJoiner.find(params[:id])
            if @user_gameweek_joiner.gameweek.complete 
                render json: "Cannot delete completed UGJ when gameweek is complete"
            else 
                if @user_gameweek_joiner.delete
                    render json: "Success"
                else 
                    render json: @user_gameweek_joiner.errors.full_messages
                end 
            end 
        end 
    
        private 
    
        def ug_joiner_params
            params.permit(:ug_id, :total_points, :user_id, :gameweek_id, :admin_user_id)
        end
    
    end
    