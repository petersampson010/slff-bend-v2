class MessagesController < ApplicationController
    include HelperModule
    skip_before_action :authenticate_request, only: [:index, :send_email, :please_work]
    
    
        def index
            messages = Message.all
            render json: find_from_params(messages, message_params)
        end
    
        def create 
            @message = Message.new(message_params)
            if @message.save
                render json: message
            else 
                render json: @message.errors.full_messages
            end 
        end 
    
    
        private 
    
        def message_params 
            params.permit(:message_id, :name, :email, :msg)
        end 
    
    end