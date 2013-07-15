require 'spec_helper'

describe UsersController do
  before(:each) do
    @user2=create(:user)
    @user= build(:user)
    @user.role=Role.find_by_name('Admin')
    @user.hospitals= [@user2.hospitals.first]
    @user.save
    @current_hospital=@user.hospitals.first 
    sign_in @user
    @user.confirm!
  end

  describe "GET #index" do

    it "should give the list of all the doctors" do
     get :index, {hospital_id: @current_hospital,type: DOCTOR}
     expect(assigns(:users)).to eq([@user2])
    end
  
  end

  describe "POST #delete" do
    it "should delete the specified user" do
      post :destroy ,{ hospital_id: @current_hospital, id: @user2.id, type: DOCTOR}
    end
  end


  describe "PUT #update" do
    it "should upadate the specified user" do
      put :update, {hospital_id: @current_hospital, id: @user2.id, type: DOCTOR, user:{name: "khush"}}
      expect(response).to redirect_to(hospital_users_path(@current_hospital, DOCTOR)) 
    end
  end


  describe "GET #show" do
    it "show the specific user" do
      get :show, {hospital_id:@current_hospital, id:@user2.id, type:DOCTOR}
      expect(assigns(:user)).to eq(@user2)
    end
  end

end
