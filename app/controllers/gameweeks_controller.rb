class GameweeksController < ApplicationController
    include HelperModule
    skip_before_action :authenticate_request, only: [:index]
    
    
        def index 
            gameweeks = Gameweek.all
            render json: find_from_params(gameweeks, gameweek_params)
        end 
    
        def create
            @gameweek = Gameweek.new(gameweek_params) 
            if @gameweek.save
                render json: @gameweek
            else 
                render json: @gameweek.errors.full_messages
            end 
        end 
    
        def update
            @gameweek = Gameweek.find(params[:id])
            if @gameweek.complete
                render json: "Cannot update gameweek once it is complete"
            else
                if @gameweek.update(gameweek_params)
                    render json: @gameweek
                else 
                    render json: @gameweek.errors.full_messages
                end 
            end
        end 
    
        def destroy 
            @gameweek = Gameweek.find(gameweek_params[:id])
            if @gameweek.complete
                render json: "Cannot delete gameweek once it is complete"
            else
                if @gameweek.delete
                else 
                    render json: @gameweek.errors.full_messages
                end 
            end    
        end 
    
        private
    
        def gameweek_params 
            params.permit(:gameweek_id, :date, :opponent, :score, :complete, :gameweek, :admin_user_id)
        end 
    end
    