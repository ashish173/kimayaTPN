class UsersController < ApplicationController
  layout 'admin'

  def index
    @selected_menu = params[:for].to_i
    if @selected_menu == DOCTOR || @selected_menu == NUTRITIONIST
      @users = @selected_menu == DOCTOR ? User.doctors : User.nutritionists
    else
      @patients = Patient.all
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
        format.html { redirect_to(users_path) }
        format.js {
          render :js => "window.location.pathname='#{users_path}'"
        }
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
