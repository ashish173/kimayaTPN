class TpnsController < ApplicationController
  before_filter :load_doctors_and_patients, :only => [ :new, :create ]
  before_filter :load_tpn, :only => [ :report, :label]
  
  def new 
    @tpn = Tpn.new 
    @doctors = User.doctors(current_user)
    @patients = current_user.user_patients
  end

  def create
    @tpn = Tpn.new(params[:tpn])
    @result = Kimaya::TPNCalc.new
    @result = @tpn.build_tpn
    respond_to do |format|
      if @tpn.save
        @tpn_infusion = @tpn.build_tpn_infusion( feed_volume_over_24_hour: 0, arterial_line_infusion: 0, inotrope_infusion: 0, other_infusion: 0 )
        @tpn_infusion.save
        format.html { render :action => 'show' }
      else
        format.html { render 'new'}
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
      render :previous_tpn_date, :formats => [:js]
    else
      render :nothing, true
    end
  end

private

  def load_doctors_and_patients
    @doctors = User.doctors(current_user)
    if current_user.role?(ADMIN)
      @patients = Patient.all
    else
      @patients = current_user.user_patients
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
