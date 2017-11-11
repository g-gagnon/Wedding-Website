class RsvpController < ApplicationController
  before_action :authenticate_user!

  SOLO_CODE = Rails.application.secrets.solo_code
  COUPLE_CODE = Rails.application.secrets.couple_code
  FAMILY_CODE = Rails.application.secrets.family_code

  def rsvp
    if current_user.user_config.undeclared?
      redirect_to code_path
    else
      @rsvp = current_user.rsvp || Rsvp.new
      @rsvp.rsvp_guests.build unless @rsvp.rsvp_guests.any?
    end
  end

  def create
    @rsvp = current_user.build_rsvp(permitted_params)

    if @rsvp.save
      flash[:success] = t('rsvp.save_success')
      redirect_to :back
    else
      render :rsvp
    end
  end

  def update
    @rsvp = current_user.rsvp
    if @rsvp.update(permitted_params)
      flash[:success] = t('rsvp.save_success')
      redirect_to :back
    else
      render :rsvp
    end
  end


  def code
    redirect_to rsvp_path unless current_user.user_config.undeclared?

    if params[:code]
      case params[:code].upcase
        when SOLO_CODE
          current_user.user_config.solo!
        when COUPLE_CODE
          current_user.user_config.couple!
        when FAMILY_CODE
          current_user.user_config.family!
        else
          flash[:alert] = 'Invalid code'
      end
      redirect_to rsvp_path unless flash[:alert]
    end
  end

private

  def permitted_params
    params.require(:rsvp).permit(:event, :menu_selection, :note, rsvp_guests_attributes: [:id, :name, :email, :meal_selection, :note, :_destroy])
  end
end