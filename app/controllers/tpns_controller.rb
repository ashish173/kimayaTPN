class TpnsController < ApplicationController
  before_filter :load_doctors_and_patients, :only => [ :index, :create ]
  before_filter :load_tpn, :only => [ :report, :label]

  def index 
    @tpn = Tpn.new 
  end

  def create
    @tpn = Tpn.new(params[:tpn])
    @result = Kimaya::TPNCalc.new
    @result = @tpn.build_tpn
    respond_to do |format|
      if @tpn.valid?
        if ( @result.errors.empty? && @result.warnings.empty? ) || params[:warning].present?
          @tpn.save
          @tpn_infusion = @tpn.build_tpn_infusion
          @tpn_infusion.save
          format.html { render :action => 'show' }
        elsif @result.errors.empty?
          @warnings = @result.warnings.collect! { |i| i.to_i }
          format.html { render :action => 'index' }
        else
          @errors = @result.errors.collect! { |i| i.to_i }
          format.html { render :action => 'index' }
        end
      else
        format.html { render :action => 'index'}
      end
    end
  end

  def report
    respond_to do |format|
      format.html{ render :action => 'report.html.haml' } 
      format.pdf do
        html = render_to_string( :partial => 'report', :formats => :html)
        kit = PDFKit.new(html)
        kit.stylesheets << "#{Rails.root}/app/assets/stylesheets/pdf.css"
        if params[:print_type]
          send_data(kit.to_pdf,:filename => "report.pdf", :type => "application/pdf", :disposition => 'attachment')
        else
          send_data(kit.to_pdf,:filename => "report.pdf", :type => "application/pdf", :disposition => 'inline')
        end
        return
      end
    end
  end

  def label
    respond_to do |format|
      format.html{ render :action => 'label.html.haml' } 
      format.pdf do
        html = render_to_string( :partial => 'label', :formats => :html)
        kit = PDFKit.new(html)
        kit.stylesheets << "#{Rails.root}/app/assets/stylesheets/pdf.css"
        if params[:print_type]
          send_data(kit.to_pdf,:filename => "label.pdf", :type => "application/pdf", :disposition => 'attachment')
        else
          send_data(kit.to_pdf,:filename => "label.pdf", :type => "application/pdf", :disposition => 'inline')
        end
        return
      end
    end
  end
  
  def previous_tpn
    if params[:patient_id].present?
      patient = Patient.find(params[:patient_id])
      date = params[:date]
      @tpn = patient.tpns.where(:tpn_date => date).first
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
    if params[:patient_id].present?
      @dates = []
      Tpn.select(:tpn_date).where(:patient_id => params[:patient_id]).each do |d| @dates  << d.tpn_date.to_s unless d.tpn_date.nil? end
      @tpn = Patient.find(params[:patient_id]).tpns.last
      render :previous_tpn_date, :formats => [:js]
    else
      render :nothing => true
    end
  end

private

  def load_doctors_and_patients
    if current_user.role?(ADMIN)
      @doctors = current_hospital.users.doctors
    else
      @doctors = [current_user]
    end
    if current_user.role?(ADMIN)
      @patients = current_hospital.patients.select("patients.id,name").to_json
    else
      @patients = current_user.user_patients.select("patients.id,name").to_json
    end
  end

  def load_tpn
    @tpn = Tpn.find(params[:id])
    @result = Kimaya::TPNCalc.new
    @result = @tpn.build_tpn
    @tpn_infusion = @tpn.tpn_infusion
    @doctor = @tpn.user
    @patient = @tpn.patient
  end

end
