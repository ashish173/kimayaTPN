class InvestigationsController < ApplicationController
  layout 'user'

  def index
    @patient = Patient.find(params[:patient_id])
    @investigations = @patient.investigations 
  end

  def new
    @patient = Patient.find(params[:patient_id])
    @investigation = Investigation.new
    @investigation.build_tpn_additive if @investigation.tpn_additive.nil?
    @investigation.build_enteral_diagnosis if @investigation.enteral_diagnosis.nil?
    @investigation.build_anthropometric_measurement if @investigation.anthropometric_measurement.nil?
    @investigation.build_blood_analysis if @investigation.blood_analysis.nil?
    @investigation.build_diagnosis if @investigation.diagnosis.nil?
    @investigation.build_biochemistry_assessment if @investigation.biochemistry_assessment.nil?
    @investigation.build_electrolyte if @investigation.electrolyte.nil?
  end

  def create
    @patient = Patient.find(params[:patient_id])
    @investigation = Investigation.new
    @investigation.blood_sugar_monitors.build if @investigation.blood_sugar_monitors.nil?
    @investigation.attributes = params[:investigation]
    @investigation.build_tpn_additive if @investigation.tpn_additive.nil?
    @investigation.build_enteral_diagnosis if @investigation.enteral_diagnosis.nil?
    @investigation.build_anthropometric_measurement if @investigation.anthropometric_measurement.nil?
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
