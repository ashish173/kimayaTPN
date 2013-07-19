require 'spec_helper'

describe UsersController do
  before(:each) do
    @user2 = create(:user)
    @user = build(:user)
    @user.role = Role.find_by_name('Admin')
    @user.hospitals = @user2.hospitals
    @user.save
    @current_hospital = @user2.hospitals.first
    sign_in @user
    @user.confirm!
  end

  describe "GET #index" do

    it "should give the list of all the doctors" do    
     get :index, {hospital_id: @current_hospital, type: DOCTOR}
     expect(assigns(:users)).to eq([@user2])
    end


    it "should give the list of all the nutritionists" do
      @user3=build(:user)
      @user3.hospitals = @user2.hospitals
      @user3.role = Role.find_by_name('Nutritionist')
      @user3.save
      get :index, {hospital_id: @current_hospital, type: NUTRITIONIST}
      expect(assigns(:users)).to eq([@user3])
    end
  
  end

  describe "POST #delete" do
    it "should delete the specified user" do
      post :destroy ,{ hospital_id: @current_hospital, id: @user2.id, type: DOCTOR}
      expect(assigns(:user)).to eq(nil)
      expect(response).to redirect_to(hospital_users_path(@current_hospital, DOCTOR)) 
    end
  end


  describe "PUT #update" do
    context "WITH VALID PARAMETERS" do
      before(:each) do
        put :update, {hospital_id: @current_hospital, id: @user2.id, type: DOCTOR, user:{name: "khush"}}
      end
    
      it "should redirect to users's hospital path" do
        expect(response).to redirect_to(hospital_users_path(@current_hospital, DOCTOR)) 
      end

      it "should update the specified user" do
        expect(assigns(:user).name).to eq("khush")
      end
    end
    
    context "WITH INVALID PARAMETERS" do

      before(:each) do
        put :update, {hospital_id: @current_hospital, id:@user2.id, type: DOCTOR, user:{name: nil}}
      end
      
      it "should not update the user" do
        expect(User.doctors.last.name).to_not eq(nil)
      end

      it "should render the edit template" do
        expect(response).to render_template(:edit)
      end
    end

  end


  describe "GET #show" do
    it "show the specific user" do
      get :show, {hospital_id:@current_hospital, id:@user2.id, type:DOCTOR}
      expect(assigns(:user)).to eq(@user2)
    end
  end

end
