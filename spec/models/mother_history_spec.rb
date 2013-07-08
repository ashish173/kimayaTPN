require 'spec_helper'

describe MotherHistory do
  let(:patient){Patient.new(gender_id:"24", name: "jolly", registration_number: "57", date_of_birth: "2013-07-3", birth_weight: 5,
                            address: "pune")}
  let(:mother){MotherHistory.new(g: 2.3, p: 4.4, a: 3.3, maternal_usg:"7887", age: "27", pre_pregnancy_weight: ">40", height: "145",
                               toxemia: "mild", diabetes: "IDDM", is_antenatal_steroids: "no", medical_history: "drugs", 
                               other_medical_problems: "none", hospital_id: 8) }



  it "must belong to a patient"do 
  mother.save
  expect(mother).to have(1).errors_on(:patient_id)
  p mother.errors.full_messages
  end

  it "should specify mother's age" do
  mother.age=nil
  expect(mother).to have(1).errors_on(:age)
  p mother.errors.full_messages
  end


  it "should specify mother's pre_pregnancy weight" do
  mother.pre_pregnancy_weight=nil
  expect(mother).to have(1).errors_on(:pre_pregnancy_weight)
  p mother.errors.full_messages
  end


  it "should have toxemia value" do
    mother.toxemia=nil
    expect(mother).to have(1).errors_on(:toxemia)
    p mother.errors.full_messages
  end


  it "should include mother's height" do
    mother.height=nil
    expect(mother).to have(1).errors_on(:height)
    p mother.errors.full_messages


  end

  it "should include diabetes type" do
    mother.diabetes=nil
    expect(mother).to have(1).errors_on(:diabetes)
    p mother.errors.full_messages

  end

  it "should have 'g' value " do
    mother.g=nil
    expect(mother).to have(1).errors_on(:g)
    p mother.errors.full_messages

  end

  it "should have 'p' value" do
    mother.p=nil
    expect(mother).to have(1).errors_on(:p)
    p mother.errors.full_messages
  end
  
  it "should have 'a' value" do
    mother.a=nil
    expect(mother).to have(1).errors_on(:a)
    p mother.errors.full_messages
  end

  it "should specify whether on antenatal_steroids" do
     mother.is_antenatal_steroids=nil
     expect(mother).to have(1).errors_on(:is_antenatal_steroids)
     p mother.errors.full_messages
  end

  it "should have a medical history" do
     mother.medical_history=nil
     expect(mother).to have(1).errors_on(:medical_history)
     p mother.errors.full_messages
  end

  it "should specify maternal_usg" do 
     mother.maternal_usg=nil
     expect(mother).to have(1).errors_on(:maternal_usg)
     p mother.errors.full_messages
  end

end
