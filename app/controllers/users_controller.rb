class UsersController < ApplicationController
  layout 'user'
  before_filter :set_menu

  def index
    if @sidemenu == DOCTOR 
      @users = User.doctors 
    else
      @users = User.nutritionists
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.attributes = params[:user]
    if @user.save
      flash[:notice] = "Successfully updated profile"
      redirect_to(hospital_users_path(current_hospital, params[:type]))
    else
      render action: 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    redirect_to hospital_users_path(current_hospital, params[:type])
  end

  def set_menu
    @selected_menu = DOCTOR 
    @sidemenu = params[:type].to_i
  end

end 
