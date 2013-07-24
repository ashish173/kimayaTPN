class TpnsController < ApplicationController
  before_filter :load_doctors_and_patients, :only => [ :index, :create, :previous_tpn_date ]
  before_filter :load_tpn, :only => [:report, :label, :show]
  before_filter :assign_nil, :only => [:create, :calculate]
  before_filter :set_menu

  def index 
    @tpn = Tpn.new 
  end

  def create
    @tpn = Tpn.new
    @tpn.hospital = current_hospital
    if @tpn.update_attributes(params[:tpn])
      redirect_to hospital_tpn_path(current_hospital,@tpn)
    else
      render action: :index
    end
  end

  def calculate
    @tpn = Tpn.new(params[:tpn])
    @tpn.hospital = current_hospital
    if @tpn.valid?
      @result = @tpn.calculate_tpn
      if ( @result.errors.empty? && @result.warnings.empty? ) || params[:warning].present?
        render "show", :formats => [:js] and return 
      else
        if @result.errors.empty?
          @warnings = @result.warnings.collect! { |i| i.to_i }
        else
          @errors = @result.errors.collect! { |i| i.to_i }
        end
      end
    end
    render 'form_load'
  end

  def report
    respond_to do |format|
      format.html { render "report.html.haml"}
      format.pdf { generate_report('report', params[:print_type]) and return }
    end
  end

  def label
    respond_to do |format|
      format.html { render "label.html.haml" }
      format.pdf { generate_report('label', params[:print_type]) and return }
    end
  end

  def generate_report(document, type)
    html = render_to_string( :partial => document, :formats => :html)
    kit = PDFKit.new(html)
    kit.stylesheets << "#{Rails.root}/app/assets/stylesheets/pdf.css"
    if type.present?
      send_data(kit.to_pdf,:filename => document + ".pdf", :type => "application/pdf", :disposition => 'attachment')
    else
      send_data(kit.to_pdf,:filename => document + ".pdf", :type => "application/pdf", :disposition => 'inline')
    end
  end

  def previous_tpn
    if params[:patient_id].present?
      patient = Patient.find(params[:patient_id])
      date = params[:date]
      @tpn = patient.tpns.where(:tpn_date => date.to_date.strftime("%F")).first
      if @tpn.present?
        render :previous_tpn, :formats => [:js]
      else
        render :previous_tpn_none, :formats => [:js]
      end
    else
      render :no_patient_select, :formats => [:js]
    end
  end

  def previous_tpn_date
    @dates = Tpn.select(:tpn_date).where(:patient_id => params[:patient_id]).collect{ |d| d.tpn_date.to_s}
    @patient = Patient.find params[:patient_id]
    @tpn = @patient.tpns.ordered.first_or_initialize
    render 'form_load'
  end

  private

  def set_menu
    @selected_menu = 'tpn' 
  end

  def load_doctors_and_patients
    if current_user.admin?
      @doctors = current_hospital.users.doctors
      @patients = current_hospital.patients.select("patients.id,name").to_json
    else
      @doctors = [current_user]
      @patients = current_user.user_patients.select("patients.id,name").to_json
    end
  end

  def load_tpn
    @tpn = Tpn.includes([:user, :patient, :tpn_infusion]).find(params[:id])
    @result = @tpn.calculate_tpn
  end

  def assign_nil
    params[:tpn][:tpn_infusion_attributes][:id] = nil
  end

end
