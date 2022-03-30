class PlayersController < ApplicationController
    include HelperModule
    skip_before_action :authenticate_request, only: [:index]
    
    
        def index 
            puts params
            puts player_params
            players = Player.all
            render json: find_from_params(players, player_params)
        end 
    
        def create
            @player = Player.new(player_params)
            if @player.save
                render json: @player
            else 
                render json: @player.errors.full_messages
            end 
        end 
    
        def  update 
            player = Player.find(params[:id])
            if @player.update(player_params)
                render json: @player
            else 
                render json: @player.errors.full_messages
            end 
        end
    
        def destroy 
            @player = Player.find(params[:id])
            if @player.delete
            else 
                render json: @player.errors.full_messages
            end
        end 
    
        def stats 
            player = Player.find(params[:p_id])
            gameweek = Gameweek.find(params[:gw_id])
            pg_joiners = PlayerGameweekJoiner.all.filter{ |pgj| pgj.player_id === player.player_id && pgj.gameweek_id<=gameweek.gameweek_id}
            last_gw_points = pg_joiners[pg_joiners.length-1].total_points
            total_points = pg_joiners.sum(&:total_points)
            bonus_points = pg_joiners.sum(&:bonus)
            form = (pg_joiners.slice(-3).sum(&:total_points))/3
            
            users = User.all.filter{ |u| u.admin_user_id===player.admin_user_id}
            records = Record.all.filter{ |r| r.gameweek_id===gameweek.gameweek_id && r.player_id===player.player_id}
            selected = (records.length*100)/users.length
    
            form = 
    
            render json: {
                total_points: total_points,
                last_gw_points: last_gw_points,
                selected: selected,
                bonus_points: bonus_points,
                form: form
            }
        end 
    
        private 
    
        def player_params 
            params.permit(:player_id, :first_name, :last_name, :position, :price, :availability, :admin_user_id)
        end 
    end
    