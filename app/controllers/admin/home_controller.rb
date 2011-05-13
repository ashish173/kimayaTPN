class Admin::HomeController < Devise::RegistrationsController 

  def new 
    @user = User.new(params[:user])
    render :layout => false
  end 

  def create
    @user = User.new(params[:user])
    respond_to do |format|
      if @user.save
        flash[:notice] = "User is Successfully created" 
        format.html {redirect_to(users_path(:for => params[:for]))}
        format.js {
          render :js => "window.location='#{users_path(:for => params[:for])}'"
        }
      else
        format.js {render :partial => 'new'}
      end
    end
  end

  def reset_password
    @user = User.find(params[:id])
    if request.get?
      reset_password_path(:id => params[:id])
    else
      success =  @user.reset_password!(params[:user][:password], params[:user][:password_confirmation])
      
      if success
        flash[:notice] = 'Password is successfully changed.'
        user = User.find(params[:id])
        if current_user == nil
          sign_in user
        end
        redirect_to my_home_path 
      else
        flash[:notice] = "Password doesn't matched"
        redirect_to reset_password_path(:id => params[:id])
      end
    end
  end

  def require_no_authentication
    #override this method as we need the sign up page after the user logged in 
  end
end
