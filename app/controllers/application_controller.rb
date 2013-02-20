class ApplicationController < ActionController::Base
  protect_from_forgery

  def my_home_path
    if current_user.present? and current_user.role?(ADMIN)
      params[:for].present? ? users_path(:for => params[:for]) : users_path(:for => DOCTOR)
    elsif (current_user.present? and current_user.role?(DOCTOR))
      patients_path
    else
      root_path 
    end
  end

end
