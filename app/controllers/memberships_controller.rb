class MembershipsController < ApplicationController
  def index
    @gym_class = GymClass.find_by(id:params[:class])
    # @gym=@gym_class.gym
    @membership = @gym_class.memberships
    
  end

  def show
    @membership = Membership.find(params[:id])
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
