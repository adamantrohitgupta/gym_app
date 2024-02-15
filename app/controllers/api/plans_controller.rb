class Api::PlansController < ApiController
  def index
    @plans = Plan.al
    render json: @plans
  end
 
  def create
    @m = Membership.find_by(id: params[:id])
    @user = current_user
    @class = @m.gym_class
    if @class
      @plan = Plan.create(user_id: @user.id, membership_id: params[:id])
      
      render json: { message: "you have successfylly buy membership",
                     membership_name: @m.name, 
                      validity: "#{@m.days} days",
                     gym_class: @class.name  }
    end
 end
 
  def upgrade
   byebug 
   @user = current_user
   @m = Membership.find_by(id: params[:id])
   @gym_class = @m.gym_class
   @user.plans.each do |x|
     if x.membership.gym_class == @m.gym_class
       x.destroy
       @plan = Plan.create(user_id: @user.id, membership_id: @m.id )
     
       render json: { message: "you have successfylly upgrade your  membership",
                     membership_name: @m.name, 
                     validity: "#{@m.days} days"
                   }        
      end
    end
  end
end
  