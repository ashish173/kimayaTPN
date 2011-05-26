class ReportsController < ApplicationController
  layout 'admin'

  def index
    @report =  Report.new
    @investigations = [].paginate(:page => params[:page], :per_page => 10)
  end

  def create
    @report =  Report.new(params[:report])
    if @report.valid?
      @selected_menu = 'report'
      @investigations = [].paginate(:page => params[:page], :per_page => 10)
      if params[:report] 
        @report_type = params[:report][:investigation]
      else
        @report_type = ""
      end
      if @report_type == 'last_day'
        @investigations = Investigation.all.paginate(:page => params[:page], :per_page =>10)
      elsif @report_type == 'summary'
        @from_date = params[:report][:start_date].to_date
        @to_date = params[:report][:end_date].to_date
        @patient = Patient.find(params[:selected_patient_id])
        @investigations = @patient.investigations.from_date(@from_date).to_date(@to_date).paginate(:page => params[:page], :per_page => 10)
      end
      render :action => 'index'
    else
      @investigations = [].paginate(:page => params[:page], :per_page => 10)
      render :action => 'index'
    end
  end

end
