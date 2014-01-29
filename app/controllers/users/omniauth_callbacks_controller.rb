class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  
  skip_before_filter :authenticate

  def facebook
    @user = User.find_for_facebook_oauth(request.env["omniauth.auth"], current_user)

    if @user.persisted?
      sign_in_and_redirect @user, :event => :authentication
      set_flash_message(:notice, :success, :kind => "Facebook") if is_navigational_format?
    else
      session["devise.facebook_data"] = request.env["omniauth.auth"]
      redirect_to_new_user_registration_url
    end
  end
end