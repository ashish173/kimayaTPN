require 'spec_helper'

describe Investigation do

  let(:invest){Investigation.new(investigated_on:Date.today)}
  let(:patient){Patient.create( gender_id: "24", name: "jill", registration_number: "101", date_of_birth: "2013-07-07", birth_weight: 5.0, 
                             address: "pune",hospital_id:2)}


  it "a patient should have a unique date of investigation" do
    patient.investigations << invest
    invest=patient.investigations.build(investigated_on:Date.today)
    expect(invest).to have(1).errors_on(:investigated_on)
    p invest.errors.full_messages
  end

  it "should have a date of investigation" do
    patient.investigations << invest
    invest.investigated_on=nil
    expect(invest).to have(1).errors_on(:investigated_on)
    p invest.errors.full_messages
  end


  it "should belong to a patient" do
    expect(invest).to have(1).errors_on(:patient_id)
    p invest.errors.full_messages
  end

end

