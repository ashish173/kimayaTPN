require 'spec_helper'

describe PatientsController do

  before(:each) do
     @user=create(:user)
     @user.confirm!
     sign_in @user
     @current_hospital=@user.hospitals.first
  end
  
  
  describe "GET #index" do
    before(:each) do
      @patient=create(:patient, hospital: @current_hospital)
      @admission=create(:admission, user: @user, hospital: @current_hospital, patient:@patient)
      get :index, hospital_id: @current_hospital.name
    end

    it "should @patients" do
      expect(assigns(:patients)).to eq([@patient])
    end

    it "should render the index template" do
      expect(response).to render_template(:index)
    end
      
    it "should give the OK response" do
      expect(response.status).to eq(200)
    end
  end


  describe "POST #create" do 

      before(:each) do
        @patient=build(:patient, hospital: @current_hospital)  
        post :create, { hospital_id:@user.hospitals.first.name,:patient=>{ gender_id: @patient.gender_id, name: @patient.name,
                        registration_number: @patient.registration_number, date_of_birth: @patient.date_of_birth,
                        birth_weight: @patient.birth_weight,address: @patient.address}
                      }
      end

      it "should create a new patient" do
        expect(assigns(:patient)).to eq(Patient.last)
      end

      it "should redirect to the patient's history page " do
        expect(response).to redirect_to  hospital_patient_history_path(@current_hospital, assigns(:patient))
      end

  end

  describe "PUT" do
    before(:each) do
      create(:patient, hospital: @current_hospital )
      @patient=Patient.first 
      put :update, { hospital_id: @current_hospital.name, id: @patient.id, :patient=>{name: "khush", address: "delhi"}}
    end

    it "should update the survey" do
      expect(assigns(:patient).name).to eq("khush")
    end

    it "should redirect to hospital's patient's history page" do
       expect(response).to redirect_to hospital_patient_history_path(@current_hospital, assigns(:patient))
    end
  end


  describe  "DELETE" do
    it "should delete the specific patient" do
      @patient=create(:patient, hospital: @user.hospitals.first )
      delete :destroy, {hospital_id: @current_hospital.name, id: @patient.id}
      expect(response).to redirect_to hospital_patients_path(@current_hospital.name)
    end
  end

  describe "HISTORY" do

      before(:each) do
        @patient=create(:patient)
        @admission=create(:admission, user: @user, hospital: @current_hospital, patient: @patient)
      end

    it "get should bring the history of a patient" do
      create(:motherHistory, patient: @patient)
      create(:patientHistory, patient: @patient)
      get :history, {hospital_id: @current_hospital.name, patient_id: @patient.id}
      expect(response.status).to  eq(200)
    end

    it "post should create history of a patient" do
      post :history, {hospital_id: @current_hospital.name,patient_id: @patient.id,
        "patient"=>{"mother_history_attributes"=>{"is_anc"=>"false", "g"=>"1", "p"=>"2", "a"=>"3", "maternal_usg"=>"234", "age"=>"18 - 35",         "pre_pregnancy_weight"=>"> 40kg", "height"=>"<= 145 cm", "toxemia"=>"moderate", "diabetes"=>"IDDM", "medical_history"=>"none",
          "other_medical_problems"=>["Smoking", ""], "is_antenatal_steroids"=>"true"}, 
          "admission_attributes"=>{"admitted_on"=>@admission.admitted_on, "id"=>@admission.id}, 
          "patient_history_attributes"=>{"gestational_age"=>"12", "ga"=>"SGA", "mode_of_delivery"=>"Forceps",
            "rupture_of_membranes"=>"24 - 48", "apgar_score_1"=>"3", "apgar_score_5"=>"4", "apgar_score_20"=>"5"}}}
        expect(response).to redirect_to new_hospital_patient_investigation_path(@current_hospital, assigns(:patient))
    end
  end

end



