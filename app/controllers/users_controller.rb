class UsersController < ApplicationController
  helper_method :destroy

  def index
   @user=current_user
   @plans = @user.plans
  end

  def show
    @user = User.find(params[:id])
    @current_user = current_user
    @rooms = Room.public_rooms
    @users = User.all_except(@current_user)
    @room = Room.new
    @message = Message.new
    @room_name = get_name(@user, @current_user)
    @single_room = Room.where(name: @room_name).first || Room.create_private_room([@user, @current_user], @room_name)
    @messages = @single_room.messages

    render "rooms/index"
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
  
  private
  
  def get_name(user1, user2)
    users = [user1, user2].sort
    "private_#{users[0].id}_#{users[1].id}"
  end
end