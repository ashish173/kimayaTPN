class ConfirmationsController < Devise::ConfirmationsController

  # GET /resource/confirmation?confirmation_token=abcdef
  def show
    user = User.find_by_confirmation_token(params[:confirmation_token])
    if user.nil?
      redirect_to '/'  and return
    elsif user.errors.empty?
      if !user.last_sign_in_at.nil? && user.confirmed_at.nil?
        if user.confirm!
          sign_in user
          redirect_to root_path and return
        end
      else
        redirect_to reset_password_path(user.current_hospital, :token => params[:confirmation_token]) and return
      end
    end
    render_with_scope :new
  end 

end
