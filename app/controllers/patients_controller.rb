class PatientsController < ApplicationController
  layout 'user'

  #list all existing patient
  def index
    @patient = current_user.user_patients
  end

  #create new patient
  def new
    @patient = Patient.new
  end

  def edit
    @patient = Patient.find(params[:id])
    @investigation = Investigation.today.patient(@patient.id)
  end

  def update
    @patient = Patient.find(params[:id]) 
    @patient.attributes = params[:patient]
    if @patient.save
      if params[:commit] == "Update"
        redirect_to(patients_path)
      else
        redirect_to(patient_info_path(@patient))
      end
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
      if params[:commit] == "Create"
        redirect_to(patients_path)
      else
        redirect_to(patient_info_path(@patient,:for => 'new'))
      end
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
    @investigation = Investigation.patient(@patient.id).today.last
    @patient.attributes = params[:patient]
    @patient.save!
    if @patient.save
      flash[:notice] = "History is successfully saved" 
      if params[:commit] == "Create"
        redirect_to(patients_path)
      else
        if @investigation == nil
          redirect_to(new_patient_investigation_path(@patient))
        else
          redirect_to(edit_patient_investigation_path(@patient,@investigation))
        end
      end
    else
      render :action => 'info'
    end
  end

  def investigate
    @patient = Patient.find(params[:patient_id]) 
    redirect_to(new_patient_investigation_path(@patient))
  end

end
