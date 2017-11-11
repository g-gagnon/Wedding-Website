class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_locale
  before_action :store_user_location!, if: :storable_location?

private
  def storable_location?
    request.get? && is_navigational_format? && !devise_controller? && !request.xhr?
  end

  def store_user_location!
    # :user is the scope we are authenticating
    store_location_for(:user, request.fullpath)
  end

  def after_sign_out_path_for(resource_or_scope)
    stored_location_for(resource_or_scope) || super
  end

  def authenticate_user!
    if user_signed_in?
      super
    else
      flash[:notice] = 'Please log in first'
      redirect_to sign_in_path
    end
  end

  def set_locale
    I18n.locale = params[:locale] || :en
  end

  def default_url_options
    { locale: I18n.locale }
  end


end
