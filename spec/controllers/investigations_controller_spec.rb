require 'spec_helper'
=begin
      # p "user --> #{@user.name}"
      # p "hospital --> #{@current_hospital.name}"
      # p "patient --> #{@patient.name}"
      # p "patient hos --> #{@patient.hospital.name}"
=end

describe InvestigationsController do
  before(:each) do
    @user = create(:user)
    @user.confirm!
    sign_in @user
    @current_hospital = @user.hospitals.first    
    @patient = create(:patient, hospital: @current_hospital)
    @admission = create(:admission, hospital: @current_hospital, patient: @patient)
  end
 
  describe "GET #index " do
    before(:each) do
      # takes arguments according to routes
      # /hospital/:hospital_id/patient/:patient_id/investigations
      get :index, hospital_id: @current_hospital.name, patient_id: @patient.id
    end

    it "should give okay response" do
      expect(response.status).to eq(200) 
    end

    it "should populate all the investigations" do
      @investigation =  create(:investigation, patient: @patient)
      expect(assigns(:investigations)).to eq([@investigation])
    end  

    it "should render index view" do
      expect(response).to render_template(:index)
    end
  end  
  
  describe "GET #new" do
    before(:each) do
      get :new, hospital_id: @current_hospital.name, patient_id: @patient.id
    end

    it "assigns @additives to last 4 additives for patient" do
      @investigation = create(:investigation)
      @additive = create(:tpn_additive, investigation: @investigation)
      #expect(assigns(:additives)).to eq([@additive])
    end

    it "should render new view" do
      expect(response).to render_template(:new)
    end
  end
  
  describe "POST #create" do
    before(:each) do
      @investigation = build(:investigation)
      @investigation.patient_id = @patient.id
      @investigation.hospital_id = @current_hospital.name
      post :create,{ :investigation => {investigated_on: @investigation.investigated_on}, hospital_id: @current_hospital.name, patient_id: @patient.id }
    end

    context "with valid attributes" do 
      it "should save the new investigation" do
        expect(assigns(:investigation)).to eq(Investigation.last)
      end

      it "should redirect to investigation index page"do
        expect(response).to redirect_to hospital_patient_investigations_path
      end
    end

    context "with invalid attributes" do
      it "should not save the new investigation" do
        @investigation.investigated_on = Date.yesterday
        @investigation.save
        expect(assigns(:investigation)).to_not eq(Investigation.last)
      end
      it "should re-render the :new template" do
        @investigation.investigated_on = nil
      end
    end
  end 

  describe "PUT #update" do
    before(:each) do

      @investigation = create(:investigation)
      @investigation.patient_id = @patient.id
      @investigation.hospital_id = @current_hospital.name
      put :update,{ id: @investigation.id, :investigation => {investigated_on: Date.today}, hospital_id: @current_hospital.name, patient_id: Patient.last.id }
    end

    context "with valid attributes" do
      it "should save the investigation" do
        expect(assigns(:investigation).patient_id).to eq(Patient.last.id)
      end
      it "should redirect to investigations index" do
        expect(response).to redirect_to hospital_patient_investigations_path
      end
    end
  end

end
