require 'spec_helper'

describe TpnsController do

  before(:each) do
    @user = create(:user)
    @user.confirm!
    sign_in @user
    @current_hospital = @user.hospitals.first
    @patient = create(:patient, hospital: @current_hospital)
    @admission = create(:admission, hospital: @current_hospital, patient: @patient) 
  end
  
  describe "GET #new" do
    before(:each) do
      get :new, {:hospital_id => @current_hospital.name , :tpn => {:investigated_on => Date.today } }
    end

    it "assign a new tpn" do
      #expect(assigns(:tpn).patient_id).to eq(@paient.id)
    end

    it "populate doctors belonging to a patient" do
      get :new, hospital_id: @current_hospital.name
      @doc = User.doctors(@user)
      expect(assigns(:doctors)).to eq(@doc)
    end

    it "should render new template" do
      get :new, hospital_id: @current_hospital.id
      expect(response).to render_template(:new)
    end
  end
  
  describe "POST #create" do
    context "with valid attributes" do      
      before(:each) do
        @tpn = create(:tpn, :hospital => @current_hospital)
        post :create, { hospital_id: @current_hospital.name , :tpn => {"day_of_tpn"=>"1", "user_id"=>"2", "patient_id"=>"2", "tpn_date"=>"19/07/2013", "current_weight"=>"2", "dextrose_conc"=>"15", "total_fluid_intake"=>"112", "fat_volume"=>"2", "fat_concentration"=>"2", "factor"=>"2", "amino_acid"=>"2", "amino_acid_additive_id"=>"12", "sodium_chloride"=>"1", "sodium_chloride_additive_id"=>"15", "potassium_chloride"=>"2", "potassium_chloride_additive_id"=>"20", "calcium"=>"3", "calcium_additive_id"=>"21", "magnesium"=>"1", "magnesium_additive_id"=>"22", "administration"=>"Central Line"} }
      end

      it "should save a new tpn" do
        expect(assigns(:tpn)).to eq(Tpn.last)
      end

      it "should render show on tpn create" do
        expect(response).to render_template(:show)
      end

      it "should build a tpn infusion on save" do
        expect(assigns(:tpn_infusion)).to be_valid
      end
    end

    context "invalid parameters" do
      before(:each) do
        @tpn = create(:tpn, :hospital => @current_hospital)
        post :create, { hospital_id: @current_hospital.name , :tpn => {"day_of_tpn"=>"1", "patient_id"=>"2", "tpn_date"=>"19/07/2013", "current_weight"=>"2", "dextrose_conc"=>"15", "total_fluid_intake"=>"112", "fat_volume"=>"2", "fat_concentration"=>"2", "factor"=>"2", "amino_acid"=>"2", "amino_acid_additive_id"=>"12", "sodium_chloride"=>"1", "sodium_chloride_additive_id"=>"15", "potassium_chloride"=>"2", "potassium_chloride_additive_id"=>"20", "calcium"=>"3", "calcium_additive_id"=>"21", "magnesium"=>"1", "magnesium_additive_id"=>"22", "administration"=>"Central Line"} }
      end

      it "should render new in case of failure" do
        expect(response).to render_template(:new)
      end
    end
  end
  


  describe "GET #previous_tpn" do
    
    it "show patient not present render no_patient_select" do
      
      get :previous_tpn,{ hospital_id: @current_hospital.name, :tpn => {:patien_id => nil } }
      expect(response).to render_template(:no_patient_select)
      
    end
    it "if patient and its tpn present render previous_tpn" do
      @tpn = create(:tpn, :hospital => @current_hospital, :patient_id => @patient.id)
      get :previous_tpn,{:hospital_id => @current_hospital.name, :patient_id => @patient.id}#, :tpn => @tpn }
      expect(response).to render_template(:previous_tpn)
    end
    it "if patient present but not tpn render previous_tpn_none" do
      get :previous_tpn, {:hospital_id => @current_hospital.name, :patient_id => @patient.id}
    end
  end

  describe "GET #previous_tpn_date" do
    it "if patient present and dates present render previous tpn date " do
      @tpn = create(:tpn, :hospital => @current_hospital, :patient_id => @patient.id)
      get :previous_tpn_date ,{:hospital_id => @current_hospital.name, :patient_id => @patient.id}#, :tpn => @tpn }
      expect(response).to render_template(:previous_tpn_date)
    end
    it "if patient not present render nothing" do
      get :previous_tpn_date, {:hospital_id => @current_hospital.name, :patient_id => nil}
      expect(response.body).to be_blank
    end
  end

  describe "GET #report" do
    it "render template report" do

    end
  end

  describe "GET #label" do
    
  end
end
