class UsersController < ApplicationController
  helper_method :destroy

  def index
   @user=current_user
   @plans = @user.plans
  end

  def show
  end

  # def add_membership
  #  if current_user.memberships.all
  #  end
  #  byebug 
  #  @user=current_user
  #  @membership=Membership.find_by(id: params[:id])
  #  @user.memberships << @membership 
    
  
  #   MyjobJob.set(wait: 1.minutes).perform_later(@membership) 
  #  redirect_to '/users/index'
  # end

  def destroy
    @user = current_user
    @user.plans.each do |x|
      @expire_date = x.created_at + x.membership.days.days
      @remaining_days = (@expire_date.to_date - Date.today).to_i
      if @remaining_days.zero?
       x.destroy
      end
    end
  end
  
end