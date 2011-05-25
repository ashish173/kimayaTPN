class PatientsController < ApplicationController
  layout 'admin'

  #list all existing patient
  def index
    @selected_menu = PATIENT
    if current_user.role?(ADMIN) or current_user.role?(SUPER_ADMIN)
      @patients = Patient.all.paginate(:page => params[:page], :per_page =>10)
    else
      @patients = current_user.user_patients.paginate(:page => params[:page], :per_page =>10)
    end
  end

  #create new patient
  def new
    @patient = Patient.new
  end

  def edit
    @patient = Patient.find(params[:id].to_i)
    logger.info  "----------------------------------------"
    logger.info params
    logger.info @patient
    @investigation = Investigation.today.patient(@patient.id).last
  end

  def update
    @patient = Patient.find(params[:id]) 
    @patient.attributes = params[:patient]
    if @patient.save
        redirect_to(patient_info_path(@patient))
    else
      render :action => 'edit' 
    end
  end


  def create
    @patient = Patient.new(params[:patient])
    if @patient.save
      flash[:notice] = "Patient is Successfully created" 
      @admission = Admission.create(:patient_id => @patient.id, :user_id => current_user.id , :admitted_on => Date.today)
      @patient.save
        redirect_to(patient_info_path(@patient,:for => 'new'))
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
    redirect_to patients_path
  end

  def info
    @patient = Patient.find(params[:patient_id])
    @patient.build_mother_history if @patient.mother_history.nil?
    @patient.build_admission if @patient.admission.nil?
    @patient.build_patient_history if @patient.patient_history.nil?
  end

  def history
    @patient = Patient.find(params[:patient_id])
    @investigation = Investigation.patient(@patient.id).today.last #returns an array
    @patient.attributes = params[:patient]
    if @patient.save
      flash[:notice] = "History is successfully saved" 
        #Today's investigation
        if @investigation == nil
          redirect_to(new_patient_investigation_path(@patient))
        else
          redirect_to(edit_patient_investigation_path(@patient,@investigation))
        end
    else
      p @patient.errors
      render :action => 'info'
    end
  end
end
