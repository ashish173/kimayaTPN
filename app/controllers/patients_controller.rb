class PatientsController < ApplicationController

  #list all existing patient
  def index
    @patient = Patient.all
  end

  #create new patient
  def new
    @patient = Patient.new
    render :layout => false
  end

  def create
    @patient = Patient.new(params[:patient])
    respond_to do |format|
      if @patient.save
        flash[:notice] = "Patient is Successfully created" 
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
