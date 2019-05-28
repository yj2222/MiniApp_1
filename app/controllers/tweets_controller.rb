class TweetsController < ApplicationController

  before_action :move_to_index, except: :index

  def index
    @tweets = Tweet.includes(:user).page(params[:page]).per(5).order("created_at DESC")
  end

  def new
  end

  def edit
    @tweet = Tweet.find(params[:id])
  end

  def create
    Tweet.create(name: tweet_params[:name], text: tweet_params[:text], user_id: current_user.id)
    redirect_to root_path
  end

  def destroy
    tweet = Tweet.find(params[:id])
    tweet.destroy
    redirect_to root_path
    # if tweet.user_id == current_user.id
    #   tweet.destroy
    # end
  end

  def update
    tweet = Tweet.find(params[:id])
    tweet.update(tweet_params)
    redirect_to root_path
    # if tweet.user_id == current_user.id
    #   tweet.update(tweet_params)
    # end
  end
  
  private
  def tweet_params
    params.permit(:text, :name)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

end
