require 'spec_helper'

describe MotherHistory do
  it "must belong to a patient"do 
    expect(build(:motherHistory, patient_id: nil)).to have(1).errors_on(:patient_id)

  end

  it "should specify mother's  age" do
    expect(build(:motherHistory, age: nil)).to have(1).errors_on(:age)
  end


  it "should specify mother's pre_pregnancy weight" do
    expect(build(:motherHistory, pre_pregnancy_weight: nil)).to have(1).errors_on(:pre_pregnancy_weight)
  end


  it "should have toxemia value" do
    expect(build(:motherHistory, toxemia: nil)).to have(1).errors_on(:toxemia)
  end


  it "should include mother's height" do
    expect(build(:motherHistory, height: nil)).to have(1).errors_on(:height)
  end

  it "should include diabetes type" do
    expect(build(:motherHistory, diabetes: nil)).to have(1).errors_on(:diabetes)
  end

  it "should have 'g' value " do
    expect(build(:motherHistory, g: nil )).to have(1).errors_on(:g)
  end

  it "should have 'p' value" do
    expect(build(:motherHistory, p: nil)).to have(1).errors_on(:p)
  end
  
  it "should have 'a' value" do
    expect(build(:motherHistory, a: nil)).to have(1).errors_on(:a)
  end

  it "should specify whether on antenatal_steroids" do
     expect(build(:motherHistory, is_antenatal_steroids: nil)).to have(1).errors_on(:is_antenatal_steroids)
  end

  it "should have a medical history" do
     expect(build(:motherHistory, medical_history: nil)).to have(1).errors_on(:medical_history)
  end

  it "should specify maternal_usg" do 
     expect(build(:motherHistory, maternal_usg: nil)).to have(1).errors_on(:maternal_usg)
  end

end
