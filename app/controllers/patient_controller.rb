class PatientController < ApplicationController

  #list all existing patient
  def index
    @patient = Patient.all
  end

  #create new patient
  def new
    @request_source = request.env["HTTP_REFERER"]
    @patient = Patient.new
    render :layout => false
  end

  def create
    @patient = Patient.new(params[:patient])
    @request_source = request.env["HTTP_REFERER"]
    respond_to do |format|
      if @patient.save
        flash[:notice] = "Successfully created Patient." 
        format.html { redirect_to(@request_source) }
        format.js {
          render :js => "window.location='#{@request_source}'"
        }
      else
        format.js {render :partial => 'new'}
      end
    end
  end
end
