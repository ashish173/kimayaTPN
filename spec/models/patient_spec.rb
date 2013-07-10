require 'spec_helper'

describe Patient do
  it "should have a name" do
    expect(build(:patient, name: nil)).to have(1).errors_on(:name)
  end

  it "should have an address" do
    expect(build(:patient, address: nil)).to have(1).errors_on(:address)
  end

  it "should have one gender" do   
    expect(build(:patient, gender_id: nil)).to have(1).errors_on(:gender_id)
  end
  
  it "should be valid if dob is less than or equal to current" do 
    expect(build(:patient)).not_to  have(1).errors_on(:date_of_birth)
  end

  it "should have a unique registration number" do
    create(:patient, registration_number: "57")
    expect(build(:patient, registration_number: "57")).to have(1).errors_on(:registration_number)
  end

  it "patient count should be within hospital's patient limit" do
    patient=create(:patient)
    p1 = build(:patient, hospital: patient.hospital)
    expect(p1).to_not be_valid
  end

  it "belong to a hospital" do
    patient=build(:patient, hospital_id: nil)
    expect(patient).to_not be_valid
  end

  it "should have only one mother_history" do
    m1=create(:motherHistory)
    expect(build(:motherHistory, patient: m1.patient)).to_not be_valid
  end

  it "should have only one patient history" do
    p1=create(:patientHistory)
    expect(build(:patientHistory, patient: p1.patient)).to_not be_valid
  end

end
  
