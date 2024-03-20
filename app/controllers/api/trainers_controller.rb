class Api::TrainersController < ApiController
  before_action :authenticate_request
  def index
     @trainers = Trainer.all
     render json: @trainers, status: :ok
  end

  def show
    @trainer = Trainer.find_by(id: params[:id])
 
    if @trainer
      render json: @trainer
    else
      render json: { error: "Trainer not found" }, status: :not_found
    end
  end   
end
  