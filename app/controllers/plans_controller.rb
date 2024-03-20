class PlansController < ApplicationController
before_action :create_stripe_customer
  def index
    @plans = Plan.all
    
  end

  def show  
  end

  def new
    @membership = Membership.find_by(id: params[:id])
    @user = current_user
    @gym_class = @membership.gym_class
    @gym = @gym_class.gym.id

    if @gym_class
      flash[:notice] = "#{@user.name.capitalize} you have successfully joined new plan."
      @session = Stripe::Checkout::Session.create(
        payment_method_types: ['card'],
        line_items: [{
          price_data: {
            currency: 'usd',
            product_data: {
              name: @membership.name,
            },
            unit_amount: @membership.price
          },
          quantity: 1
        }],
        mode: 'payment',
        payment_intent_data:{
          setup_future_usage: 'off_session',
        },
        success_url: 'http://localhost:3000/users',
        cancel_url: 'http://localhost:3000/courses/cancel',
      )
    end
    
    @plan = Plan.create(user_id: @user.id, membership_id: @membership.id, gym_id: @gym, gym_class_id: @gym_class.id, session_id: @session.id)
    # MyjobJob.set(wait: 2.minutes).perform_later(@session.id)
  end 

  def edit
  end
  
  def upgrade
    @new_membership = Membership.find_by(id: params[:id])
    user_plans = current_user.plans
    if user_plans.present? 
      old_plan = user_plans.find_by(gym_class_id: @new_membership.gym_class.id)
      @extra_charge =   @new_membership.price - old_plan.membership.price
      if @extra_charge > 0
        @session = Stripe::Checkout::Session.create(
        payment_method_types: ['card'],
        line_items: [{
          price_data: {
            currency: 'usd',
            product_data: {
              name: @new_membership.name,
            },
            unit_amount: @extra_charge.to_i
          },
          quantity: 1
        }],
        mode: 'payment',
        payment_intent_data:{
          # capture_method: 'manual',
        },
        customer: current_user.stripe_id,
        success_url: 'http://localhost:3000/users',
        cancel_url: 'http://localhost:3000/courses/cancel',
      )  
        old_plan.update(membership_id: @new_membership.id, session_id: @session.id)
        flash[:notice] = "#{current_user.name.capitalize} you have successfully joined new plan."
      
      elsif @extra_charge < 0 
        flash[:notice] = "#{current_user.name.capitalize} you have already a  upgraded plan."
        redirect_to users_path
      end
    else  
      redirect_to users_path
    end
  end

  private 

  def create_stripe_customer 
   if current_user.stripe_id == nil 
    stripe_customer = Stripe::Customer.create({email: current_user.email})
 
      current_user.update(stripe_id: stripe_customer.id)
    end
  end
end
