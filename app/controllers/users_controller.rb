class UsersController < ApplicationController
  before_action :authenticate_user!
  def index
    @user = User.all
  end

  def show
    user = User.find(params[:id])
    @nickname = user.nickname
    @tweets = user.tweets

    @following_users = current_user.following_user
    @follower_users = current_user.follower_user
   
  end

  def mypage
  end
end
