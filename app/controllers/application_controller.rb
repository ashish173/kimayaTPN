class ApplicationController < ActionController::Base
  protect_from_forgery

  def set_layout
    if current_user.role?(ADMIN) or current_user.role?(SUPER_ADMIN)
      render :layout => 'admin'
    end
  end

  def is_super_admin?(user = nil)
    user = current_user if user.nil?
    user.role?(SUPER_ADMIN)
  end

  def my_home_path
    if (current_user.present? and is_super_admin?)
      params[:for].present? ? users_path(:for => params[:for]) : users_path(:for => DOCTOR)
    elsif (current_user.present? and current_user.role?(DOCTOR))
      patients_path
    else
      root_path 
    end
  end

end
