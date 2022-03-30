class ApplicationController < ActionController::Base
    protect_from_forgery with: :null_session
    before_action :authenticate_request
    skip_before_action :authenticate_request, only: [:welcome]



    def welcome
        render json: "Welcome to SLFF API"
    end 
end
