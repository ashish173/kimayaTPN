class InvestigationsController < ApplicationController

  def build_resources
      @investigation = Investigation.new
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
    if params[:for_day].present?
      build_resources
      @investigation.investigated_on = params[:for_day]
      @additives = TpnAdditive.to_date(@investigation.investigated_on).for_patient(@patient).last(4)
    else
      build_resources
      @investigation.investigated_on = Time.now 
      @additives = TpnAdditive.to_date(@investigation.investigated_on).for_patient(@patient).last(4)
    end
  end

  def create
    @patient = Patient.find(params[:patient_id])
    @investigation = Investigation.new params[:investigation]
    if @investigation.save
      redirect_to hospital_investigations_path(current_hospital), notice: "Investigation created successfully" 
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
      redirect_to hospital_investigations_path(current_hospital), notice: "Investigation changed successfully" 
    else
      @additives = TpnAdditive.to_date(@investigation.investigated_on).for_patient(@patient).last(4)
      render action: 'edit'
    end
  end

  def search
    @selected_menu = "investigation"
    if current_user.admin?
      @investigations = Investigation.order("investigated_on DESC").last(20).paginate(:page => params[:page], :per_page =>10)
    else
      @investigations = Investigation.for_user(current_user).order("investigated_on DESC").last(20).paginate(:page => params[:page], :per_page =>10)
    end
    @patients = Patient.for_user(current_user).map(&:name)
    @is_search = true 
  end

  def results
    @patient = Patient.find_by_name(params[:info][:patient])
    @investigation = Investigation.day(params[:info][:date].to_date).patient(@patient).last
    if @investigation.nil?
      redirect_to investigation_new_path(@patient, params[:info][:date].to_date, :display => 'search')  
    else
      redirect_to edit_patient_investigation_path(@patient,@investigation, :display => 'search')
    end
  end

  def autocomplete_patient_name
    term = params[:term] 
    if term && !term.empty?
      items = Patient.for_user(current_user).where(["LOWER(name) LIKE ?", "%#{term}%"])
    end
    render :json => json_for_autocomplete(items, :name,nil)
  end

end
