require 'spec_helper'

describe Hospital do
  it "should have a unique name" do
    create(:hospital, name: "ruby")
    expect(build(:hospital, name: "ruby")).to have(1).errors_on(:name)
  end

  it "should have patients within its limit if specified" do 
    p1= create(:patient)
    expect(build(:patient, hospital: p1.hospital)).to_not be_valid
  end
end
