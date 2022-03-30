class ApplicationController < ActionController::Base
    before_action :authenticate_request
    skip_before_action :authenticate_request, only: [:welcome]



    def welcome
        render json: "Welcome to SLFF API"
    end 
end
