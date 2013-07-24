class ApplicationController < ActionController::Base
  protect_from_forgery


  before_filter :authenticate_user!
  before_filter :current_hospital

  def current_hospital
    return true if is_super_admin?
    return @current_hospital if @current_hospital.present?
    
    if current_user
      if params[:hospital_id].present?
        @current_hospital = Hospital.find_by_slug params[:hospital_id]
        if @current_hospital.nil?
          flash[:message] = "Unauthorized access!!"
          redirect_to root_url
        end
      else
        @current_hospital = current_user.hospitals.first  
      end 
      return @current_hospital
    end
  end
  helper_method :current_hospital

  def my_home_path
    if current_user.present? and current_user.admin?
      params[:type].present? ? hospital_users_path(current_hospital, params[:type]) : hospital_users_path(current_hospital, DOCTOR)
    elsif (current_user.present? and current_user.doctor?)
      hospital_patients_path(current_hospital)
    else
      hospital_home_path(current_hospital)
    end
  end

  def authenticate_user!(opts={})
    return true if is_super_admin?
    super
  end

  def is_super_admin?
    #p request.url
    request.url.split('/').include?('admin')
  end

end
