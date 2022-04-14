class PlayerGameweekJoinersController < ApplicationController
    include HelperModule
    skip_before_action :authenticate_request, only: [:index]
    
    
        def index 
            pg_joiners = PlayerGameweekJoiner.all
            render json: find_from_params(pg_joiners, pg_joiner_params)
        end 
    
        def create
            @player_gameweek_joiner = PlayerGameweekJoiner.new(pg_joiner_params)
            if @player_gameweek_joiner.save
                render json: @player_gameweek_joiner
            else 
                render json: @player_gameweek_joiner.errors.full_messages
            end 
        end 
    
        def update
            @player_gameweek_joiner = PlayerGameweekJoiner.find(params[:id])
            if @player_gameweek_joiner.update(pg_joiner_params)
                render json: @player_gameweek_joiner
            else 
                render json: @player_gameweek_joiner.errors.full_messages
            end 
        end 
    
        def destroy 
            player_gameweek = PlayerGameweekJoiner.find(params[:id])
            if @player_gameweek_joiner.delete
            else 
                render json: @player_gameweek.errors.full_messages
            end
        end 
    
        def by_user
            records = Record.all.filter{ |r| r.user_id === params[:user_id].to_i}
            player_ids = records.map{|r| r.player_id}
            pg_joiners = PlayerGameweekJoiner.all.filter{ |pgj| player_ids.include?(pgj.player_id)}
            render json: pg_joiners
        end
    
        private
    
        def pg_joiner_params
            params.permit(:pg_id, :minutes, :assists, :goals, :own_goals, :y_cards, :r_cards, :bonus, :penalty_miss, :goals_conceded, :total_points, :player_id, :gameweek_id, :admin_user_id)
        end 
    end
    