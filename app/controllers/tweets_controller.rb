class TweetsController < ApplicationController
  
  def index
    @tweets = Tweet.includes(:user)
  end

  def new
    @tweet = Tweet.new
  end

  def create
    tweet = Tweet.create(tweet_params)
    if tweet.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    tweet = Tweet.find(params[:id])
    if tweet.destroy
      redirect_to root_path
    end
  end

  def edit
 @tweet = Tweet.find(params[:id])
  end

  def update
    tweet = Tweet.find(params[:id])
    if tweet.update(tweet_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def show
    @tweet = Tweet.find(params[:id])
  end


  private

  def tweet_params
    
    params.require(:tweet).permit(:text,:image).merge(user_id: current_user.id)
  
  end
end