class InvestigationsController < ApplicationController
  layout 'user'

  def index
    @patient = Patient.find(params[:patient_id])
    @investigations = @patient.investigations 
  end

  def new
    @patient = Patient.find(params[:patient_id])
    @investigation = Investigation.new
    @investigation.build_blood_analysis
    @investigation.build_diagnosis 
    @investigation.build_biochemistry_assessment 
    @investigation.build_electrolyte
    2.times{@investigation.blood_sugar_monitors.build}
  end

  def create
    @patient = Patient.find(params[:patient_id])
    @investigation = Investigation.new
    @investigation.attributes = params[:investigation]
    if @investigation.save
      flash[:notice] = "Investigation created successfully" 
      if params[:commit] == 'Create'
        redirect_to(patients_path)
      else
        redirect_to(edit_patient_additive_investigation_path(@patient,@investigation))
      end
    else
      render :action => 'new'
    end
  end

  def edit
    @patient = Patient.find(params[:patient_id])
    @investigation = Investigation.find(params[:id])
    @investigation.build_blood_analysis if @investigation.blood_analysis.nil?
    @investigation.build_diagnosis if @investigation.diagnosis.nil?
    @investigation.build_biochemistry_assessment if @investigation.biochemistry_assessment.nil?
    @investigation.build_electrolyte if @investigation.electrolyte.nil? 
  end

  def update
    @patient = Patient.find(params[:patient_id])
    @investigation = Investigation.find(params[:id])
    @investigation.attributes = params[:investigation]
    if @investigation.save
      flash[:notice] = "Investigation changed successfully" 
      if params[:commit] == 'Create'
        redirect_to(patients_path)
      else
        redirect_to(edit_patient_additive_investigation_path(@patient,@investigation))
      end
    else
      render :action => 'edit'
    end
  end
  
end
