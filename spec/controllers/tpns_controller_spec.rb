require 'spec_helper'

describe TpnsController do

  before(:each) do
    @user = create(:user)
    @user.confirm!
    sign_in @user
    @current_hospital = @user.hospitals.first
    @patient = FactoryGirl.create :patient, hospital: @current_hospital
    @admission = create :admission, hospital: @current_hospital, patient: @patient 
  end
  
  describe "POST #create" do
    context "with valid attributes" do 
      before(:each) do
        @tpn = create(:tpn, :hospital => @current_hospital)
         post :create, { hospital_id: @current_hospital.name , :tpn => {"day_of_tpn"=>"1", "user_id"=>"2", "patient_id"=>"2", "tpn_date"=>"#{Date.today}", "current_weight"=>"2", "dextrose_conc"=>"10", "total_fluid_intake"=>"112", "fat_volume"=>"2", "fat_concentration"=>"10", "factor"=>"1", "amino_acid"=>"2", "amino_acid_additive_id"=>"12", "sodium_chloride"=>"1", "sodium_chloride_additive_id"=>"15", "potassium_chloride"=>"2", "potassium_chloride_additive_id"=>"20", "calcium"=>"3", "calcium_additive_id"=>"21", "magnesium"=>"1", "magnesium_additive_id"=>"22", "administration"=>"Central Line", :tpn_infusion_attributes=>{"id"=>"12" } } }
      end
      it "should save a new tpn" do
        expect(assigns(:tpn).tpn_date).to eq(Date.today)
      end
      it "should render show on" do
        expect(response).to redirect_to hospital_tpn_path(@current_hospital, assigns(:tpn))
      end

    end
    
    context "invalid parameters" do
      before(:each) do
        @tpn = create(:tpn, :hospital => @current_hospital)
         post :create, { hospital_id: @current_hospital.name , :tpn => {"day_of_tpn"=>"1", "user_id"=>"2", "patient_id"=>"2", "tpn_date"=>"#{Date.today}", "current_weight"=>"2", "dextrose_conc"=>"1", "total_fluid_intake"=>"112", "fat_volume"=>"2", "fat_concentration"=>"10", "factor"=>"1", "amino_acid"=>"2", "amino_acid_additive_id"=>"12", "sodium_chloride"=>"1", "sodium_chloride_additive_id"=>"15", "potassium_chloride"=>"2", "potassium_chloride_additive_id"=>"20", "calcium"=>"3", "calcium_additive_id"=>"21", "magnesium"=>"1", "magnesium_additive_id"=>"22", "administration"=>"Central Line", :tpn_infusion_attributes=>{"id"=>"12" } } }
      end

      it "should render index in case of failure" do
        expect(response).to render_template(:index)
      end
    end
  end
  
  describe "GET #previous_tpn" do
    
    it "show patient not present render no_patient_select" do
      get :previous_tpn,{ hospital_id: @current_hospital.name, :tpn => {:patient_id => nil, :date => Date.yesterday } }
      expect(response).to render_template(:no_patient_select)
    end

    it "if patient and its tpn present render previous_tpn" do
      @tpn = create(:tpn, :hospital => @current_hospital, :patient_id => @patient.id)
      get :previous_tpn,{ hospital_id: @current_hospital.name, :tpn => {:id => Tpn.last.id},:patient_id => Patient.last.id, :date => Date.yesterday }
      expect(response).to render_template(:previous_tpn)
    end

    it "if patient present but not tpn render previous_tpn_none" do
      get :previous_tpn,{ hospital_id: @current_hospital.name, :date => Date.yesterday, :patient_id => Patient.last.id }
      expect(response).to render_template(:previous_tpn_none)
    end

  end 

  describe "GET #previous_tpn_date" do
    
    it "if patient present and dates present" do
      @tpn = create(:tpn, :hospital => @current_hospital, :patient_id => @patient.id)
      #get :previous_tpn_date ,{:hospital_id => @current_hospital.name, :patient_id => @patient.id}
      #expect(response.body).to be_blank
    end

  end
end 

