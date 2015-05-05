class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def twitter
    if current_user.nil?
      @user = User.from_twitter(request.env["omniauth.auth"])

      if @user.persisted?
        sign_in_and_redirect @user, :event => :authentication
        set_flash_message(:notice, :success, :kind => "Twitter") if is_navigational_format?
      else
        session["devise.twitter_data"] = request.env["omniauth.auth"]
        redirect_to new_user_registration_url
      end
    else
      auth = request.env["omniauth.auth"]
      TwitterAccount.create uid: auth.uid, handle: auth.info.nickname, token: auth.credentials.token, secret: auth.credentials.secret, owner: current_user
      redirect_to user_root_url
    end
  end
end
