require 'spec_helper'

describe Investigation do
  it "a patient should have a unique date of investigation" do
    i1=create(:investigation)
    expect(build(:investigation, patient: i1.patient)).to have(1).errors_on(:investigated_on)
  end

  it "should have a date of investigation" do
    expect(build(:investigation, investigated_on: nil)).to have(1).errors_on(:investigated_on)
  end

  it "should have only one blood analysis" do
    b1=create(:blood_analysis)
    expect(build(:blood_analysis, investigation: b1.investigation)).to have(1).errors_on(:investigation_id)
  end

  it "should have only one anthropometric measurement" do
    b1=create(:anthropometric_measurement)
    expect(build(:anthropometric_measurement, investigation: b1.investigation)).to have(1).errors_on(:investigation_id)
  end

  it "should have only one tpn_additive" do
    b1=create(:tpn_additive)
    expect(build(:tpn_additive, investigation: b1.investigation)).to have(1).errors_on(:investigation_id)
  end

  it "should have only one biochemistry_assessment" do
    b1=create(:biochemistry_assessment)
    expect(build(:biochemistry_assessment, investigation: b1.investigation)).to have(1).errors_on(:investigation_id)
  end

  it "should have only one diagnosis" do
    b1=create(:diagnosis)
    expect(build(:diagnosis, investigation: b1.investigation)).to have(1).errors_on(:investigation_id)
  end

  it "should have only one electrolyte" do
    b1=create(:electrolyte)
    expect(build(:electrolyte, investigation: b1.investigation)).to have(1).errors_on(:investigation_id)
  end

  it "should have only one enteral_diagnosis" do
    b1=create(:enteral_diagnosis)
    expect(build(:enteral_diagnosis, investigation: b1.investigation)).to have(1).errors_on(:investigation_id)
  end

end

