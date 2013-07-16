require 'spec_helper'

describe TpnInfusionsController do
 before(:each) do
   @user=create(:user)
   @current_hospital= @user.hospitals.first
   @tpn=create(:tpn, user: @user)
   sign_in @user
   @user.confirm!
   @tpn_infusion=create(:tpn_infusion, tpn: @tpn)
 end

 describe "POST #create" do
   it "should create a new tpn_infusion" do    
     post :create, {hospital_id:@current_hospital.name, tpn_infusion:{ tpn_id: @tpn_infusion.tpn_id}}
     expect(response).to render_template('tpn_infusion')
   end
 end
 
 describe "PUT #update" do
  
   before(:each) do
    put :update, {hospital_id:@current_hospital.name, id:@tpn_infusion.id, tpn_infusion:{feed_volume_over_24_hour: "25"}}
   end
   
   it "should render the tpn_infusion template" do
    expect(response).to render_template('tpn_infusion')
   end
   
   it "should update the specified tpn_infusion" do
     expect(assigns(:tpn_infusion).feed_volume_over_24_hour).to eq(25.0)
   end
 end

 end


