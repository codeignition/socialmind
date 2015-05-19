class UsersController < ApplicationController
  def index
    current_user.accept_invitation params[:token]
    session[:current_account] ||= current_user.social_accounts.first.to_param
    redirect_to SocialAccount.find(session[:current_account])
  end
end
