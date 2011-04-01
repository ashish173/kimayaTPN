class Admin::HomeController < Devise::RegistrationsController 


  def new 
    @user = User.new(params[:user])
  end 

  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = "Successfully created User." 
      render :action => 'new'
    else
      render :action => 'new'
    end
  end

  def reset_password

    @user = User.find(params[:id])
    if request.get?
      reset_password_path(:id => params[:id])
    else
      success =  @user.reset_password!(params[:user][:password], params[:user][:password_confirmation])
      if user_signed_in?
        if success
          flash[:notice] = 'Password is successfully changed.'
          root_path
        else
          flash[:notice] = "Password doesn't matched"
          redirect_to reset_password_path(:id => params[:id])
        end
      else
        if success
          sign_in(@user)
          current_user = @user if !current_user.present?
        end
      end
    end
  end
  def require_no_authentication
    if (current_user.present? and current_user.role?(SUPER_ADMIN))
      new_user_registration_path 
    else
      redirect_to root_path
    end
  end
end
