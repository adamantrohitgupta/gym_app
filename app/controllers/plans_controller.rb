class PlansController < ApplicationController
  def index
    @plans = Plan.all
  end

  def show
     
  end

  def new
    @user=current_user
    @m=Membership.find_by(id:params[:id])
    @class=@m.gym_class
    if @class
    @plan = Plan.create(user_id: @user.id, membership_id: params[:id])
    redirect_to "/users/index"
    end
  end
  
   
  def edit
  end

  def upgrade
    @user = current_user
    @m=Membership.find_by(id:params[:id])
    @gym_class = @m.gym_class
    @user.plans.each do |x|
     if x.membership.gym_class == @m.gym_class
       x.destroy
       redirect_to "/plans/new?id=#{@m.id}"
     else
      
     end
    end
  end
end

# if current_user.memberships.include?(membership)  
#   link_to " Joined", "/users/index", 
#   elsif current_user.memberships.any? {|x| x.gym_class == membership.gym_class } 
#   upgrade membership", "/plans/upgrade_membership?id=#{membership.id}"  
#   else 
#   "Create Payment", "/plans/new?id=#{membership.id}" 
# end  
