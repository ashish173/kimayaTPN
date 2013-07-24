require 'spec_helper'

describe AdditivesController do

  describe "GET #index" do
    it "show all the tpnMarketAdditives"
  end

  describe "GET #new" do
    it "assign a new additives"
    it "should not render layout"
  end
  describe "GET #edit" do
    it "find additive"
    it "render layout false"
  end
  describe "POST #create" do
    context "with valid parameters" do
      it "should render window location"
      it "should save the additive"
    end  
    context "with invalid attributes" do
      it "should render new"
      it "should not save additive"
    end
  end
  describe "PUT #update" do
    context "with valid parameters" do
      it "should render window location on update"
      it "should save the additives"
    end
    context "with invalid parameters" do
      it "should render edit"
      it "should not save the additives"
    end
  end
  describe "DELETE #destroy" do
    it "should delete the additive"
    it "redirect to additive_path"
  end

end
