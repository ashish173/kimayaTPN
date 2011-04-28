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

  def edit
    @patient = Patient.find(params[:id])
    render :layout => false
  end

  def update
    @patient = Patient.find(params[:id]) 
    @patient.attributes = params[:patient]
    respond_to do |format|
      if @patient.save
        flash[:notice] = "Successfully updated profile"
        format.html {redirect_to(patients_path)}
        format.js {
          render :js => "window.location='#{patients_path}'"
        }
      else
        format.js { render :partial => 'edit'}
      end
    end
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

  def destroy
    Patient.find(params[:id]).destroy
    respond_to do |format|
      format.html {redirect_to patients_path }
    end
  end
end
