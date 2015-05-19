module ApplicationHelper
  def current_account
    @current_account ||= SocialAccount.find session[:current_account]
  end
end
