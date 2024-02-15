class Api::GymClassesController < ApiController
  before_action :authenticate_request, except: :create

  def index
    @gym_classes = GymClass.all
    render json: @gym_classes
  end

  def show
    @gymclass = GymClass.find_by(id:params[:id])
    @membership = @gymclass.memberships
    if @gymclass
      render json:{gymclass: @gymclass, memberships: @membership }
    else
      render json: { error: "class not found"  }, status: :unprocessable_entity
    end
  end

  def new
    @gym_class = GymClass.new
    render json: @gym_class
  end

  def create
    @gym_class = GymClass.new(gym_class_params)

    if @gym_class.save
      render json: @gym_class, status: :created
    else
      render json: { errors: @gym_class.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def edit
    @gym_class = GymClass.find(params[:id])
    render json: @gym_class
  end

  def update
    @gym_class = GymClass.find(params[:id])

    if @gym_class.update(gym_class_params)
      render json: @gym_class
    else
      render json: { errors: @gym_class.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @gym_class = GymClass.find(params[:id])
    @gym_class.destroy
    head :no_content
  end

  private

  def gym_class_params
    params.require(:gym_class).permit(:name, :description, :start_time, :end_time, :images, :gym_id, :trainer_id, :capacity)
  end
end
  