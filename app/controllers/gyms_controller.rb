class GymsController < ApplicationController
 before_action :authenticate_user!,only: %i[show]
  def index
    gymes = Gym.all
     
  end
 
  def show
    @gym = Gym.find(params[:id])
    @gym_classes = @gym.gym_classes
  end
 
  def new
    @gym = Gym.new
  end
 
  def create
    @gym = Gym.new(gym_params) 
    if @gym.save
      redirect_to @gym
    else
      render :new
    end
  end
 
  def edit
    @gym = Gym.find(params[:id])
  end
 
  def update
   @gym= Gym.find(params[:id])
    if @gym.update(gym_params)
     redirect_to @gym
    else
     render :edit, status: :unprocessable_entity
    end
  end

 def destroy
   @gym = Gym.find(params[:id])
   @gym.destroy
   redirect_to gyms_path, status: :ok
  end

  private
  def gym_params
   params.require(:gym).permit(:name,:discription,:images)
  end
end
