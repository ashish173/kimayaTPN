class ReportsController < ApplicationController
  before_filter :set_menu

  def index
    @report =  Report.new
    @investigations = [].paginate(:page => params[:page], :per_page => 10)
    @patients = current_user.admin? ? current_hospital.patients : current_user.patients
  end

  def create
    @report =  Report.new(params[:report])
    @patients = current_hospital.patients 
    @report_type = params[:report][:investigation]
    if @report.valid?
      if @report_type == 'last_day'
        @investigations = Investigation.day(Date.today - 1.day).paginate(:page => params[:page], :per_page =>10)
      elsif @report_type == 'summary'
        @from_date = params[:report][:start_date].to_date
        @to_date = params[:report][:end_date].to_date
        @patient = Patient.find(params[:report][:patient])
        @investigations = @patient.investigations.between_date(@from_date, @to_date).ordered.paginate(:page => params[:page], :per_page => 10)
      end
    else
      @patient = Patient.find(params[:report][:patient])
      @investigations = @patient.investigations.ordered.paginate(:page => params[:page], :per_page => 10)
    end
    render :action => 'index'
  end

  def set_menu
    @selected_menu = 'report' 
  end

end
