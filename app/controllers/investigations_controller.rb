class InvestigationsController < ApplicationController
  layout 'user'

  def index
    @patient = Patient.find(params[:patient_id])
    @investigations = @patient.investigations 
  end

  def new
    @patient = Patient.find(params[:patient_id])
    @investigation = Investigation.new
    @investigation.build_tpn_additive
    @investigation.build_enteral_diagnosis
    @investigation.build_anthropometric_measurement
    @investigation.build_blood_analysis
    @investigation.build_diagnosis 
    @investigation.build_biochemistry_assessment 
    @investigation.build_electrolyte
    @investigation.blood_sugar_monitors.build
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
