class TpnsController < ApplicationController
  layout 'admin'
  before_filter :load_doctors_and_patients, :only => [ :new, :create ]

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
        @tpn_infusion = @tpn.build_tpn_infusion
        format.html { render :action => 'show' }
      else
        format.html { render 'new'}
      end
    end
  end

  def report
    @tpn = Tpn.find(params[:id])
    @result = Kimaya::TPNCalc.new
    @result = @tpn.build_tpn
    @tpn_infusion = @tpn.tpn_infusion
    @doctor = @tpn.user
    @patient = @tpn.patient
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

private
  def load_doctors_and_patients
    @doctors = User.doctors(current_user)
    if current_user.role?(SUPER_ADMIN)
      @patients = Patient.all
    else
      @patients = current_user.user_patients
    end
  end
end
