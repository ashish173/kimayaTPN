class SessionsController < Devise::SessionsController

  def after_sign_in_path_for(scope)
    my_home_path 
  end

  def after_sign_out_path_for(scope)
    params[:return_url] ? params[:return_url] : root_path
  end

end

