class InvestigationsController < ApplicationController

  layout 'admin'

  def build
      @investigation = Investigation.new
      @investigation.build_blood_analysis
      @investigation.build_diagnosis 
      @investigation.build_biochemistry_assessment 
      @investigation.build_electrolyte
      2.times{@investigation.blood_sugar_monitors.build}
      @investigation.build_tpn_additive
      @investigation.build_enteral_diagnosis
      @investigation.build_anthropometric_measurement 
      @additives = @patient.daily_tpn_additives.last(4)
  end

  def index
    @patient = Patient.find(params[:patient_id])
    @investigations = @patient.investigations 
  end

  def new
    @patient = Patient.find(params[:patient_id])
    if params[:for_day].present?
      build();
      @investigation.investigated_on = params[:for_day]
      @additives = TpnAdditive.to_date(@investigation.investigated_on).for_patient(@patient).last(4)
    elsif Investigation.today.patient(@patient).empty?
      build();
      @investigation.investigated_on = Date.today
      @additives = TpnAdditive.to_date(@investigation.investigated_on).for_patient(@patient).last(4)
    else
      @investigation = Investigation.today.patient(@patient).last
      redirect_to edit_patient_investigation_path(@patient,@investigation)
    end
  end

  def create
    @patient = Patient.find(params[:patient_id])
    @investigation = Investigation.new
    @investigation.attributes = params[:investigation]
    @additives = @patient.daily_tpn_additives.last(4)
    if @investigation.save
      flash[:notice] = "Investigation created successfully" 
      redirect_to(investigations_search_path)
    else
      render :action => 'new'
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
    @investigation.attributes = params[:investigation]
    @additives = TpnAdditive.to_date(@investigation.investigated_on).for_patient(@patient).last(4)
    if @investigation.save
      flash[:notice] = "Investigation changed successfully" 
      redirect_to(investigations_search_path)
    else
      render :action => 'edit'
    end
  end

  def search
    @selected_menu = "investigation"
    if current_user.role?(ADMIN) or current_user.role?(SUPER_ADMIN)
      @investigations = Investigation.order("investigated_on").last(20).paginate(:page => params[:page], :per_page =>10)
    else
      @investigations = Investigation.for_user(current_user).order("investigated_on").last(20).paginate(:page => params[:page], :per_page =>10)
    end
    @patients = Patient.for_user(current_user).to_json
  end

  def results
    @patient = Patient.find(params[:selected_patient_id])
    @investigation = Investigation.day(params[:info][:date].to_date).patient(@patient).last
    if @investigation.nil?
      redirect_to new_patient_investigation_path(@patient,:for_day => params[:info][:date])  
    else
      redirect_to edit_patient_investigation_path(@patient,@investigation)
    end
  end

  def autocomplete_patient_name
    term = params[:term] 
    if term && !term.empty?
      items = Patient.for_user(User.find(2)).where(["LOWER(name) LIKE ?", "%#{term}%"])
    end
    render :json => json_for_autocomplete(items, :name,nil)
  end

end
