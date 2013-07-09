require 'spec_helper'

describe Admission do
  
  
  let(:patient){Patient.create(gender_id: "24", name: "jane", registration_number: "78", date_of_birth: Date.today,
                birth_weight: 5.6, address: "pune",hospital_id:2)}

  
  
  it "must be done by a user" do
    admission=patient.build_admission(admitted_on: Date.yesterday, hospital_id: 2)
    expect(admission).to have(1).errors_on(:user_id) 
  end


  it "must belong to a patient" do
    admission=Admission.new(admitted_on: Date.today, hospital_id: 2, user_id:2)
    expect(admission).to have(1).errors_on(:patient_id)
  end
  
  
  it "must have an admission date" do
    admission=patient.build_admission(hospital_id:2, user_id:2)
    expect(admission).to have(1).errors_on(:admitted_on)
  end

  it "must have a valid date between patient's DOB and todays date" do 
    admission=patient.build_admission(admitted_on: Date.yesterday, hospital_id: 2, user_id:2)      
    expect(admission).to_not be_valid
  end

  it "must belong to a hospital" do
    admission=patient.build_admission(admitted_on:Date.today, user_id:2)
    expect(admission).to_not be_valid
  end
 
end
