class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def facebook
    if request.env["omniauth.auth"].info.email.blank?
      flash[:alert] = 'You need to share your Facebook email to continue.'
      return redirect_to sign_in_path
      # return redirect_to user_facebook_omniauth_authorize_path(auth_type: 'rerequest', scope: 'email')
    end

    @user = User.from_omniauth(request.env["omniauth.auth"])

    if @user.persisted?
      sign_in_and_redirect @user, :event => :authentication
      set_flash_message(:notice, :success, :kind => "Facebook") if is_navigational_format?
    else
      session["devise.facebook_data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
  end

  def failure
    flash[:alert] = "Error while trying to log in with Facebook. Try again."
    redirect_to sign_in_path
  end
end