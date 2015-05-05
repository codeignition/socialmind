class TwitterAccountsController < ApplicationController
  before_action :set_twitter_account

  def show
    @timeline = @twitter_account.client.user_timeline
  end

  def tweet
    @twitter_account.client.update(params[:text])
    redirect_to @twitter_account
  end

  private
  def set_twitter_account
    @twitter_account = TwitterAccount.find(params[:id])
  end
end
