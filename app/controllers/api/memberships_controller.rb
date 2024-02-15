class Api::MembershipsController < ApiController
    before_action :authenticate_request

    def index
    #   @gym_class = GymClass.find_by(id:params[:id])
    #   @gym=@gym_class.gym
    #   @membership = @gym_class.memberships
    #   render json:{gym_class: @gym_class.name, gym: @gym_class.gym.name,
    #                memberships: @membership  },status: :found
    @membership = Membership.all
    render json:@membership
    end
  
    def show
      @membership = Membership.find(params[:id])
      render json: @membership
    end
  
    def new
      @membership = Membership.new
    end
  
    def create
      @membership = Membership.new(membership_params)
      if @membership.save
        redirect_to @membership, status: :created
      else
        render :new
      end
    end
    
    def edit
    end
  
    def destroy
      @membership = Membership.find(params[:id])
      if @membership.destroy
        render :show
      end
    end
  
    private
    
    def membership_params
      params.require(:membership).permit(:name,:discription,:days,:price, :gym_id, :gym_class_id)
    end
  end
  
