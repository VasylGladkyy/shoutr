class FollowersController < ApplicationController
  def index
    @user = find_user
    @followers = @user.followers.paginate(page: params[:page], per_page: 15)
  end
  
  private
  
  def find_user
    @_user ||= User.find_by(username: params[:user_id])
  end
end
