class PatientsController < ApplicationController
  before_filter :set_menu

  def index
    if current_user.admin?
      @patients = Patient.ordered.paginate(:page => params[:page], :per_page =>10)
    else
      @patients = current_user.user_patients.ordered.paginate(:page => params[:page], :per_page =>10)
    end
  end
  
  def new
    @patient = Patient.new
  end

  def edit
    @patient = Patient.find(params[:id].to_i)
  end

  def update
    @patient = Patient.find(params[:id]) 
    @patient.attributes = params[:patient]
    if @patient.save
        redirect_to hospital_patient_history_path(current_hospital, @patient)
    else
      render :action => 'edit' 
    end
  end


  def create
    @patient = Patient.new(params[:patient])
    @patient.hospital_id = current_hospital.id
    if @patient.save
      flash[:notice] = "Patient is Successfully created" 
      Admission.create!(:patient => @patient, :user => current_user , :admitted_on => Date.today, hospital: current_hospital)
      redirect_to hospital_patient_history_path(current_hospital, @patient)
    else
      render :action  => 'new'
    end
  end

  def show
    @patient = Patient.find(params[:id])
    @mother_history = @patient.mother_history
    @patient_history = @patient.patient_history
  end

  def destroy
    Patient.find(params[:id]).destroy
    redirect_to hospital_patients_path(current_hospital)
  end

  def history
    @patient = Patient.find(params[:patient_id])
    if request.get?
      @patient.build_mother_history if @patient.mother_history.nil?
      @patient.build_admission if @patient.admission.nil?
      @patient.build_patient_history if @patient.patient_history.nil?
    else
      @patient.attributes = params[:patient]
      if @patient.save
        flash[:notice] = "History is successfully saved" 
        if @investigation = Investigation.today.patient(@patient.id).empty?
          redirect_to new_hospital_patient_investigation_path(current_hospital, @patient)
        else
          redirect_to hospital_patient_investigations_path(current_hospital, @patient)
        end
      end
    end
  end

  def search
    if current_user.doctor?
      @patients = current_user.user_patients.search(params[:keyword]).ordered.paginate(:page => params[:page], :per_page =>10)
    else
      @patients = Patient.search(params[:keyword]).ordered.paginate(:page => params[:page], :per_page =>10)
    end
    render :partial => 'search'
  end

  def set_menu
    @selected_menu = PATIENT
  end
end  
