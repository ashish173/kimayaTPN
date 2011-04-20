class UserController < Devise::ConfirmationsController

  # GET /resource/confirmation?confirmation_token=abcdef
  def show
    user = User.find_by_confirmation_token(params[:confirmation_token])
    if user.nil?
      redirect_to '/'  and return
    elsif user.errors.empty?
      if !user.last_sign_in_at.nil? && user.confirmed_at.nil?
        if user.confirm! # confirm the user with the token
          sign_in user # sign in the current user
          redirect_to root_path and return
        end
      else
        if user.confirm!
          redirect_to reset_password_path(:id => user) and return
        end
      end
    end
    render_with_scope :new
  end 

  def display
    @user = User.find(params[:format])
  end

  def edit
    @user = User.find(params[:format])
    render :layout => false
  end

  def update
    @user = User.find(current_user.id)
    @user.attributes = params[:user]
    @request_source = request.env["HTTP_REFERER"]
    respond_to do |format|
      if @user.save
        flash[:notice] = "Successfully updated profile"
        format.html { redirect_to(@request_source) }
        format.js {
          render :js => "window.location='#{@request_source}'"
        }
      else
        format.js {render :partial => 'edit'}
      end
    end
  end

end 
