require 'spec_helper'

describe Hospital do
  
  let(:hospital){Hospital.create(name:"ruby",patients_count:1)}
  let(:patient){Patient.create(gender_id: "24", name:"jill", registration_number:"101", date_of_birth:Date.today, birth_weight:5,
                               address:"pune",hospital_id:2)}
  
  it "should have a unique name" do
    Hospital.create(name:"ruby")
    expect(hospital).to have(1).errors_on(:name)
    p hospital.errors.full_messages
  end

  it "should have patients within its limit if specified" do 
    hospital.patients << patient
    #hospital.patients.create(gender_id: "24", name:"jane", registration_number:"11", date_of_birth:Date.today, birth_weight:5,
     #                       address:"pune",hospital_id:2)
    
     patient=hospital.patients.build(gender_id:"24", name: "jane", registration_number: "60", date_of_birth: "2013-07-4", birth_weight: 5,
                                         address:"pune")
       expect(hospital).to_not be_valid
       p patient.errors.full_messages

    #expect(hospital).to_not be_valid


     
  end

  it "should have patients"

  it "should have users"
end
