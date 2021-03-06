class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def twitter
    if current_user.nil?
      @user = User.from_twitter(request.env["omniauth.auth"])
      @user.accept_invitation params[:token]
      sign_in_and_redirect @user, :event => :authentication
      set_flash_message(:notice, :success, :kind => "Twitter") if is_navigational_format?
    else
      redirect_to TwitterAccount.from_oauth(request.env["omniauth.auth"], current_user)
    end
  end
end
