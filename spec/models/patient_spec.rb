require 'spec_helper'

describe Patient do
  
  let(:hospital){Hospital.create(name: "ruby", patients_count:2)}
  let(:patient){Patient.new(gender_id:"24", name: "jolly", registration_number: "57", date_of_birth: "2013-07-3", birth_weight: 5,
                            address: "pune")}
  
  it "should have a valid admission date" do
    hospital.patients << patient
    admission=patient.build_admission(admitted_on: "2013-07-1", hospital_id: hospital.id,user_id:3)
    patient.save
    expect(admission).to have(1).errors_on(:admitted_on)
  end

  it "should have a name" do
    patient.name=nil
    expect(patient).to have(1).errors_on(:name)
  end

  it "should have an address" do
    patient.address=nil
    expect(patient).to have(1).errors_on(:address)
  end

  it "should have one gender" do   
    expect(patient).to_not  have(1).errors_on(:gender_id)
  end

  
  it "dob should be less than current" do 
    expect(patient).to_not  have(1).errors_on(:date_of_birth)
  end

  it "should have a unique registration number" do
    hospital.patients << patient
    patient=hospital.patients.build(gender_id:"24", name: "khush", registration_number: "57", date_of_birth: "2013-07-4", birth_weight: 5,                                      address:"pune")
    expect(patient).to_not be_valid
  end

  it "patient count should be within hospital's patient limit" do
    hospital.patients<<patient
    patient=hospital.patients.create(gender_id:"24", name: "jamie", registration_number: "59", date_of_birth: "2013-07-4", birth_weight: 5,
                                     address:"pune")

    patient=hospital.patients.build(gender_id:"24", name: "jane", registration_number: "60", date_of_birth: "2013-07-4", birth_weight: 5,
                                    address:"pune")
    expect(hospital).to_not be_valid
  end

  it "belong to a hospital" do
    patient.save
    expect(patient).to_not be_valid
  end

end
  
