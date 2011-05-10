class InvestigationsController < ApplicationController
  layout 'user'

  def index
    @patient = Patient.find(params[:patient_id])
    @investigations = @patient.investigations 
  end

  def new
    @patient = Patient.find(params[:patient_id])
    @investigation = Investigation.new
    #@investigation = Investigation.patient(@patient.id).today.empty? ? Investigation.new : Investigation.patient(@patient.id).today.last
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
    @investigation = Investigation.patient(@patient.id).today.empty? ? Investigation.new : Investigation.patient(@patient.id).today.last
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
    @investigation = Investigation.today.patient(@patient).last
    if @investigation == nil
      redirect_to new_patient_investigation_path(@patient)
    end
  end

  def update
    @investigation = Investigation.find(params[:id])
    @investigation.attributes = params[:investigation]
    if @investigation.save
      flash[:notice] = "Investigation changed successfully" 
      redirect_to(patients_path)
    else
      render :action => 'edit'
    end
  end
  
end
