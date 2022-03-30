class RecordsController < ApplicationController
    include HelperModule
    skip_before_action :authenticate_request, only: [:index]
    
    
        def index 
            records = Record.all
            render json: find_from_params(records, record_params)
        end 
    
        def create
            @record = Record.new(record_params)
            if @record.save 
                render json: @record
            else 
                render json: @record.errors.full_messages
            end 
        end 
    
        def update
            @record = Record.find(params[:id])
            if @record.update(record_params)
                render json: @record
            else 
                render json: @record.errors.full_messages
            end 
        end
    
        def custom_update
            records = Record.all
            puts request.GET
            record = find_from_params(records, request.GET)[0]
            puts record.player_id 
            puts request.POST.except!("record")
            record.update(request.POST.except!("record"))
            puts record
            render json: record
        end
    
        def destroy
            @record = Record.find(params[:id])
            if @record.delete
            else 
                render json: @record.errors.full_messages
            end 
        end 
    
        private 
    
        def record_params 
            params.permit(:record_id, :sub, :captain, :vice_captain, :user_id, :player_id, :gameweek_id, :admin_user_id)
        end 
    
        def patch_body_params
            request.POST.permit(:record_id, :sub, :captain, :vice_captain, :user_id, :player_id, :gameweek_id, :admin_user_id)
        end
    
    end