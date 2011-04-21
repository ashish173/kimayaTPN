class ConfirmationsController < Devise::ConfirmationsController

  # GET /resource/confirmation?confirmation_token=abcdef
  def show
    user = User.find_by_confirmation_token(params[:confirmation_token])
    if user.nil?
      redirect_to '/'  and return
    elsif user.errors.empty?
      if !user.last_sign_in_at.nil? && user.confirmed_at.nil?
        if user.confirm! # confirm the user with the token
          sign_in user # sign in the current user
          redirect_to root_path and return
        end
      else
        if user.confirm!
          redirect_to reset_password_path(:id => user) and return
        end
      end
    end
    render_with_scope :new
  end 

end
