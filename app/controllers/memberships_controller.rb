class MembershipsController < ApplicationController
  def index
    @gym_class = GymClass.find_by(id:params[:class])
    @gym=@gym_class.gym
    @membership = @gym_class.memberships
  end
  def show
    # @membership = Membership.find(params[:id])
  end

  def new
    @membership = Membership.new
  end
  def create
    @membership = Membership.new(membership_params)
    if @membership.save
      redirect_to @membership
    else  
      render :new
    end
  end
  
  def edit
  end

  def destroy
  end
  private
  def membership_params
    params.require(:membership).permit(:name,:discription,:start_date)
  end
end
