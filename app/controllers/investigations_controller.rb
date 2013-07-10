class InvestigationsController < ApplicationController

  def build_resources
      @investigation = Investigation.new(investigated_on: Time.now)
      @investigation.methods.select{|b| 
        b.to_s.starts_with?('build_') && !['build_patient', 'build_hospital'].include?(b.to_s)
      }.each do |m|
        @investigation.send(m)
      end
      2.times{@investigation.blood_sugar_monitors.build}
      @additives             = @patient.daily_tpn_additives.last(4)
      @investigation.patient = @patient
  end

  def index
    @patient        = Patient.find(params[:patient_id])
    @investigations = @patient.investigations.ordered.paginate(:page => params[:page], :per_page =>10)
    @investigation  = Investigation.today.patient(@patient).last
  end

  def new
    @patient = Patient.find(params[:patient_id])
    build_resources
    @additives = TpnAdditive.to_date(@investigation.investigated_on).for_patient(@patient).last(4)
  end

  def create
    @patient = Patient.find(params[:patient_id])
    @investigation = Investigation.new params[:investigation], patient_id: @patient.id, hospital_id: current_hospital.id
    if @investigation.save
      redirect_to hospital_patient_investigations_path(current_hospital, @patient), notice: "Investigation created successfully" 
    else
      @additives = @patient.daily_tpn_additives.last(4)
      render action: 'new'
    end
  end

  def edit
    @patient = Patient.find(params[:patient_id])
    @investigation = Investigation.find(params[:id])
    @additives = TpnAdditive.to_date(@investigation.investigated_on).for_patient(@patient).last(4)
  end

  def update
    @patient = Patient.find(params[:patient_id])
    @investigation = Investigation.find(params[:id])
    if @investigation.update_attributes(params[:investigation])
      redirect_to hospital_patient_investigations_path(current_hospital, @patient), notice: "Investigation changed successfully" 
    else
      @additives = TpnAdditive.to_date(@investigation.investigated_on).for_patient(@patient).last(4)
      render action: 'edit'
    end
  end

end
