class GymClassesController < ApplicationController
  before_action :authenticate_user!,only: %i[show]
  def index
     @gymclass = GymClass.find(params[:format])
  end

  def show
    @gym_class = GymClass.find(params[:id])
  end

  def new
    @gym_class = GymClass.new
  end
   
  def create
   @gym_class = GymClass.new(gym_class_params)

    if @gym_class.save
     redirect_to @gym_class
    else
     render :new
    end
  end

  def edit
    @gym_class = GymClass.find(params[:id])
  end
  
  def update
    @gym_class = GymClass.find(params[:id])
    if @gym_class.update(gym_class_params)
     redirect_to @gym_class
    else
     render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @gym_class = GymClass.find(params[:id])
    @gym_class.destroy
    redirect_to gym_classes_path, status: :see_other
  end

  private
  def gym_class_params
    params.require(:gym_class).permit(:name,:description,:start_time,:end_time,:images,:video,:gym_id,:trainer_id,:capacity)
  end
end
