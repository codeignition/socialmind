class UsersController < ApplicationController
  def index
    current_user.accept_invitation params[:token]
    @shared_accounts = current_user.shared_accounts
    @social_accounts = current_user.social_accounts
  end
end
