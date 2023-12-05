class PlansController < ApplicationController
  def index
    @plans = Plan.all
  end

  def show  
  end

  def new
    @user = current_user
    @m = Membership.find_by(id: params[:id])
    @class = @m.gym_class
    if @class
      @plan = Plan.create(user_id: @user.id, membership_id: params[:id])
      PlanconfirmationMailer.plan_notification(@user,@m).deliver_now
      flash[:notice] = "#{@user.name.capitalize} you have successfully joined new plan."
      redirect_to "/users/index"
    end
  end

  def edit
  end
  
  def upgrade
    @user = current_user
    @m = Membership.find_by(id: params[:id])
    @gym_class = @m.gym_class
    @user.plans.each do |x|
      if x.membership.gym_class == @m.gym_class
        x.destroy
        redirect_to "/plans/new?id=#{@m.id}"
      end
    end
  end
end
