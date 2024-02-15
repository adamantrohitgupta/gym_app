 
class Api::UsersController < ApiController
  before_action :authenticate_request,except:[:create,:login]
  def index
    @users = User.all
    render json: @users, status: :found  
  end
 
  def plan
    @user=current_user
    @plans = @user.plans
    render json: {  name: @user.name, email: @user.email,  plans: @plans }
  end
  
 def show
    @user = User.find_by(id:params[:id])
    if  @user
     render json: @user
    else
       render json: { error: " user not found"},status: :not_found
    end
 end

 def create
   @user = User.new(user_params)
   if @user.save
     token = AuthenticationService.encode_token(@user.id)
     render json: { token: token }
   else
     render json: { error: @user.errors.full_messages }, status: :unprocessable_entity
   end
 end

 def login
   user = AuthenticationService.authenticate(params[:email], params[:password])
   if user
     token = AuthenticationService.encode_token(user.id)
     render json: { token: token,name:user.name,email: user.email }
   else
     render json: { error: 'Invalid email or password' }, status: :unauthorized
   end
 end

 private
 
 def user_params
   params.permit(:email, :password,:name,:address)
 end
end
