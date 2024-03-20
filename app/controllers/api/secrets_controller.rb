class Api::SecretsController < ApiController
    before_action :authenticate_request
  
    def index
      @users = User.all
    end
  
    def secret_action
      render json: { message: "Welcome, #{current_user.email}!" }
    end
  end