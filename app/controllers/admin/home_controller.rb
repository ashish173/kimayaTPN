class Admin::HomeController < Devise::RegistrationsController 

  def reset_password
    @user = User.find_by_confirmation_token(params[:token])
    if request.put?
      @user.reset_password!(params[:user][:password], params[:user][:password_confirmation])
      if @user.errors.empty? 
        flash[:notice] = 'Password changed successfully'
        @user.confirm! 
        sign_in @user if current_user.nil?
        redirect_to my_home_path 
      else
        flash[:notice] = "Password doesn't matched"
      end
    end
  end

  def require_no_authentication
    #override this method as we need the sign up page after the user logged in 
  end
end
