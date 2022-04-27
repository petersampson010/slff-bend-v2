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
    
        # def update
        #     @record = Record.find(params[:id])
        #     if @record.update(record_params)
        #         render json: @record
        #     else 
        #         render json: @record.errors.full_messages
        #     end 
        # end
    
        def custom_update
            @record = find_from_params(Record.all, request.GET)[0]
            if @record.gameweek.complete
                render json: "Cannot update record when gameweek is complete"
            else 
                if @admin_user_token
                    render json: "AU cannot update record"
                else 
                    if @record.update(request.POST.except!("record"))
                        render json: @record
                    else
                        render json: @record.errors.full_messages
                    end 
                end 
            end
        end
    
        def destroy
            @record = Record.find(params[:id])
            if @record.gameweek.complete
                render json: "Cannot delete record once the gameweek is complete"
            else 
                if @record.delete
                else 
                    render json: @record.errors.full_messages
                end 
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