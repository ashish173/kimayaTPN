require 'spec_helper'

describe Admission do
    
  it "must be done by a user" do
    expect(build(:admission, user_id: nil)).to have(1).errors_on(:user_id) 
  end

  it "must belong to a patient" do
    expect(build(:admission, patient_id: nil)).to have(1).errors_on(:patient_id)
  end
  
  it "must have an admission date" do
    expect(build(:admission, admitted_on: nil)).to have(1).errors_on(:admitted_on)
  end

  it "must have a valid date between patient's DOB and todays date" do 
    expect(build(:admission,admitted_on: Date.yesterday)).to have(1).errors_on(:admitted_on)
  end

  it "must belong to a hospital" do
    expect(build(:admission, hospital_id: nil)).to have(1).errors_on(:hospital_id)
  end
 
end
