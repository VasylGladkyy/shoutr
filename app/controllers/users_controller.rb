class UsersController < Clearance::UsersController
  def new
    @user = User.new
    authorize @user
  end
  
  def show
    @user = User.find_by(username: params[:id])
    authorize @user
    @timeline = Timeline.new([@user])
  end
  
  private
  
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end