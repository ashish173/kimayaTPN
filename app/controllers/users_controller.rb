class UsersController < ApplicationController
  
  layout 'admin'
  before_filter :is_super_admin?

  def index
   @selected_menu = params[:for].to_i
   if @selected_menu == DOCTOR || @selected_menu == NUTRITIONIST
     @users = @selected_menu == DOCTOR ? User.doctors : User.nutritionists
     @users = @users.order("name").paginate(:page => params[:page], :per_page =>10)
   else
     @patients = Patient.ordered.paginate(:page => params[:page], :per_page => 10)
   end
  end

  def show
    @user = User.find(params[:id])
    render :layout => false
  end

  def edit
    @user = User.find(params[:id])
    render :layout => false
  end

  def update
    @user = User.find(params[:id])
    @user.attributes = params[:user]
    respond_to do |format|
      if @user.save
        flash[:notice] = "Successfully updated profile"
        if is_super_admin? 
          format.html { redirect_to(users_path(:for => @user.roles_mask))}
          format.js {
            render :js => "window.location='#{users_path(:for => @user.roles_mask)}'"
          }
        else
          format.html { redirect_to(user_path) }
          format.js {
            render :js => "window.location='#{user_path}'"
          }
        end
      else
        format.js {render :partial => 'edit'}
      end
    end
  end

  def destroy
    User.find(params[:id]).destroy
    respond_to do |format|
      format.html{redirect_to users_path(:for => params[:for])}
    end
  end

end 
