require 'spec_helper'

describe PatientHistory do

  it "is invalid without patient id" do 
    expect(build(:patientHistory, patient_id: nil)).to have(1).errors_on(:patient_id)
  end

  it "is invalid without gestational_age" do
    expect(build(:patientHistory, gestational_age: nil)).to have(1).errors_on(:gestational_age)
  end

  it "is invalid without ga" do
    expect(build(:patientHistory, ga: nil)).to have(1).errors_on(:ga)
  end 

  it "is invalid without mode of delivery" do
    expect(build(:patientHistory, mode_of_delivery: nil)).to have(1).errors_on(:mode_of_delivery)
  end 
    
  it "is invalid without rupture of membranes" do
    expect(build(:patientHistory, rupture_of_membranes: nil)).to have(1).errors_on(:rupture_of_membranes)
  end

  it "is invalid without apgar score 1" do
    expect(build(:patientHistory, apgar_score_1: nil)).to have(1).errors_on(:apgar_score_1)
  end 

  it "is invalid without apgar score 5" do
    expect(build(:patientHistory, apgar_score_5: nil)).to have(1).errors_on(:apgar_score_5)
  end 

  it "is invalid without apgar score 20" do
    expect(build(:patientHistory, apgar_score_20: nil)).to have(1).errors_on(:apgar_score_20)
  end

end
