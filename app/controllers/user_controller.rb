class UserController < ApplicationController

  def display
    @user = current_user
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
