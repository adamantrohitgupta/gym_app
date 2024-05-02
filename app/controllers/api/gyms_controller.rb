class Api::GymsController < ApiController
  before_action :authenticate_request

  def index
  byebug
    @gyms = Gym.all
    render json: @gyms
  end

  def show
    @gym = Gym.find_by(id: params[:id])
    if @gym
      render json: @gym
    else
      render json: { error: "gym not found" }
    end
  end

  def gymclass
    @gym = Gym.find_by(id: params[:id])
    if @gym
      @gym_classes = @gym.gym_classes
      render json: { gym_name: @gym.name, class: @gym_classes }
    else
      render json: { error: "gym not found" }
    end
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
    @gym = Gym.find(params[:id])
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
    params.require(:gym).permit(:name, :description, :images)
  end
end
