class AdditiveInvestigationsController < ApplicationController
  layout 'user'

  def index
    @patient = Patient.find(params[:patient_id])
    @additive_investigations = @patient.investigations 
  end

  def new
    @patient = Patient.find(params[:patient_id].to_i)
    @investigation = Investigation.new
    @additives = @patient.daily_tpn_additives.last(5)
    @investigation.build_tpn_additive if @investigation.tpn_additive.nil?
    @investigation.build_enteral_diagnosis if @investigation.enteral_diagnosis.nil?
    @investigation.build_anthropometric_measurement if @investigation.anthropometric_measurement.nil?
    @investigation.build_blood_analysis if @investigation.blood_analysis.nil?
    @investigation.build_diagnosis if @investigation.diagnosis.nil?
    @investigation.build_biochemistry_assessment if @investigation.biochemistry_assessment.nil?
    @investigation.build_electrolyte if @investigation.electrolyte.nil?
  end

  def create
    @patient = params[:investigation][:patient_id]
    @investigation = Investigation.new
    @investigation.attributes = params[:investigation]
    @additives = @patient.daily_tpn_additives.last(5)
    if @investigation.save
      flash[:notice] = "Additive created successfully" 
      redirect_to(patients_path)
    else
      render :action => 'new'
    end
  end

  def edit
    @investigation = Investigation.find(params[:id])
    @investigation.build_blood_analysis if @investigation.blood_analysis.nil?
    @investigation.build_diagnosis if @investigation.diagnosis.nil?
    @investigation.build_biochemistry_assessment if @investigation.biochemistry_assessment.nil?
    @investigation.build_electrolyte if @investigation.electrolyte.nil?
    @additives = @investigation.patient.daily_tpn_additives.last(5)
    @additives.pop
  end

  def update
    @investigation = Investigation.find(params[:id])
    @investigation.attributes = params[:investigation]
    @additives = @investigation.patient.daily_tpn_additives.last(5)
    @additives.pop
    if @investigation.save
      flash[:notice] = "Additive changed successfully" 
      redirect_to(patients_path)
    else
      render :partial => 'edit'
    end
  end
end
