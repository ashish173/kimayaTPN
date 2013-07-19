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
    it "assign a new tpn" do
      @tpn = build(:tpn, patient_id: @patient.id)

      #get :new, hosptal_id: @current_hospital.id
      #expect(assigns(:tpn)).to eq(@tpn)
    end

    it "populate doctors belonging to a patient" do
      get :new, hospital_id: @current_hospital.id
      @doc = User.doctors(@user)
      #expect(assigns(:doctors)).to eq([@doc])
    end

    it "should render new template" do
      get :new, hospital_id: @current_hospital.id
      #expect(response).to render_template(:new)
    end
  end
  
  describe "POST #create" do
    before(:each) do
      #@tpn = create(:tpn, :hospital_id => @current_hospital.id)
      @tpn = Tpn.create("day_of_tpn"=>"1", "user_id"=>"2", "patient_id"=>"2", "tpn_date"=>"19/07/2013", "current_weight"=>"2", "dextrose_conc"=>"15", "total_fluid_intake"=>"112", "fat_volume"=>"2", "fat_concentration"=>"2", "factor"=>"2", "amino_acid"=>"2", "amino_acid_additive_id"=>"12", "sodium_chloride"=>"1", "sodium_chloride_additive_id"=>"15", "potassium_chloride"=>"2", "potassium_chloride_additive_id"=>"20", "calcium"=>"3", "calcium_additive_id"=>"21", "magnesium"=>"1", "magnesium_additive_id"=>"22", "administration"=>"Central Line", "hospital_id" => @current_hospital.name)
    end

    it "create a new tpn" do
      post :create, { hospital_id: @current_hospital.name , :tpn => {"day_of_tpn"=>"1", "user_id"=>"2", "patient_id"=>"2", "tpn_date"=>"19/07/2013", "current_weight"=>"2", "dextrose_conc"=>"15", "total_fluid_intake"=>"112", "fat_volume"=>"2", "fat_concentration"=>"2", "factor"=>"2", "amino_acid"=>"2", "amino_acid_additive_id"=>"12", "sodium_chloride"=>"1", "sodium_chloride_additive_id"=>"15", "potassium_chloride"=>"2", "potassium_chloride_additive_id"=>"20", "calcium"=>"3", "calcium_additive_id"=>"21", "magnesium"=>"1", "magnesium_additive_id"=>"22", "administration"=>"Central Line"}}# "hospital_id"=>"kem"} }
      
      #post :create, { hospital_id: @current_hospital.name , :tpn => @tpn }
      expect(assigns(:tpn)).to eq(Tpn.last)
    end
    it "should save a new tpn"
    it "should build a tpn infusion on save"
    it "should render show on tpn create"
    it "should render new in case of failure"
  end
  
  describe "GET #report" do
    it "render template report"
  end

  describe "GET #label" do
    
  end

  describe "GET #previous_tpn" do
    it "show patient not present render no_patient_select"
    it "if patient and its tpn present render previous_tpn"
    it "if patient present but not tpn render previous_tpn_none"
  end

  describe "GET #previous_tpn_date" do
    it "if patient present and dates present render previous tpn date "
    it "if patient not present render nothing"

  end
end
