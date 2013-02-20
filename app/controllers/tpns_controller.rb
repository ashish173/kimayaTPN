class TpnsController < ApplicationController
  layout 'admin'
  
  def new 
    @tpn = Tpn.new 
    @doctors = User.doctors(current_user)
    @patients = current_user.user_patients
  end

  def create
    @tpn = Tpn.new(params[:tpn])
    respond_to do |format|
      if @tpn.save
        format.html { redirect_to(patients_path) }
        format.js {
          render :js => "window.location='#{patients_path}'"
        }
      else
        format.js {render :partial => 'new'}
      end
    end
  end
end
