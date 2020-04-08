class UsersController < Clearance::UsersController
  def index
    authorize current_user
    @users = User.all.paginate(page: params[:page], per_page: 15)
  end
  
  def show
    @user = User.find_by(username: params[:id])
    authorize @user
    @timeline = Timeline.new([@user])
  end

  def new
    @user = User.new
    authorize @user
  end
  
  private
  
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end