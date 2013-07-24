require 'spec_helper'

describe PatientsController do

  before(:each) do
     @user=create(:user)
     @current_hospital=@user.hospitals.first
     @user.confirm!
     sign_in @user
  end
  
  
  describe "GET #index" do
   before(:each) do
     @user2=build(:user)
     @user2.hospitals = @user.hospitals
     @user2.role = Role.find_by_name('Admin')
     @user2.save
     @patient2=create(:patient, hospital: @current_hospital)
     @admission2=create(:admission, user: @user2, patient: @patient2, hospital: @current_hospital)
     @patient=create(:patient, hospital: @current_hospital)
     @admission=create(:admission, user: @user, hospital: @current_hospital, patient:@patient)

   end

    it "a doctor should see patients only under him" do
     get :index, hospital_id: @current_hospital.name
     expect(assigns(:patients)).to eq([@patient])
    end

    it "admin should be able to see all the patients" do
      sign_out @user
      @user2.confirm!
      sign_in @user2
      get :index, hospital_id: @current_hospital.name
      expect(assigns(:patients)).to eq(Patient.all)
    end

    it "should render the index template" do
      get :index, hospital_id: @current_hospital.name
      expect(response).to render_template(:index)
    end
      
    it "should give the OK response" do
      expect(response.status).to eq(200)
    end
  end

  describe "GET #show" do
    it "should show the specified user" do 
      mH=create(:motherHistory)
      pH=create(:patientHistory, patient: mH.patient)
      get :show, {hospital_id:@current_hospital, id: mH.patient}
      expect(assigns(:patient)).to eq(mH.patient)
      expect(assigns(:mother_history)).to eq(mH)
      expect(assigns(:patient_history)).to eq(pH)
    end
  end


  describe "POST #create" do 
    
    context "WITH VALID PARAMETERS" do

      before(:each) do
        @patient=build(:patient, hospital: @current_hospital)  
        post :create, { hospital_id:@current_hospital,:patient=>{ gender_id: @patient.gender_id, name: @patient.name,
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
    
    context "WITH INVALID PARAMETERS" do
      before(:each) do
        @patient=build(:patient, hospital:@current_hospital)
        post :create,{hospital_id: @current_hospital, :patient=>{ name: nil, address: nil}}
      end


        it "should not save the patient" do
         expect(assigns(:patient)).to_not eq(Patient.last)
        end

        it " render new template" do
          expect(response).to render_template(:new)
        end
      end
  end

  describe "PUT #update" do
    before(:each) do
      create(:patient, hospital: @current_hospital )
      @patient=Patient.first 
    end

    it "should update the patient" do
      put :update, { hospital_id: @current_hospital.name, id: @patient.id, :patient=>{name: "khush", address: "delhi"}}
      expect(assigns(:patient).name).to eq("khush")
      expect(response).to redirect_to hospital_patient_history_path(@current_hospital, assigns(:patient))
    end


    it "should render edit if update is failed" do
      put :update, { hospital_id: @current_hospital.name, id: @patient.id, :patient=>{name: "khush", address: nil}}
      expect(response).to render_template(:edit)
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


    it "redirect to patients investigation's path if investigation is present" do
        @invest=create(:investigation, patient:@patient)
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



