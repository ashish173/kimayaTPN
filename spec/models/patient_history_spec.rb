require 'spec_helper'

describe PatientHistory do
  let(:patientHistory) { PatientHistory.create(patient_id: 1,gestational_age: 12,
    ga: 13, mode_of_delivery: "df", rupture_of_membranes: "qweee",apgar_score_1: "asd",
    apgar_score_5: "sdd", apgar_score_20: "dff") }
  

  it "is invalid without patient id" do 
    patientHistory.patient_id = nil
    expect(patientHistory).to have(1).errors_on(:patient_id)
  end

  it "is invalid without gestational_age" do
    patientHistory.patient_id = nil
    expect(patientHistory).to have(1).errors_on(:patient_id)
  end

  it "is invalid without ga" do
    patientHistory.ga = nil
    expect(patientHistory).to have(1).errors_on(:ga)
  end 

  it "is invalid without mode of delivery" do
    patientHistory.mode_of_delivery = nil
    expect(patientHistory).to have(1).errors_on(:mode_of_delivery)
  end 
    
  it "is invalid without rupture of membranes" do
    patientHistory.rupture_of_membranes = nil
    expect(patientHistory).to have(1).errors_on(:rupture_of_membranes)
  end

  it "is invalid without apgar score 1" do
    patientHistory.apgar_score_1 = nil
    expect(patientHistory).to have(1).errors_on(:apgar_score_1)
  end 

  it "is invalid without apgar score 5" do
    patientHistory.apgar_score_5 = nil
    expect(patientHistory).to have(1).errors_on(:apgar_score_5)
  end 

  it "is invalid without apgar score 20" do
    patientHistory.apgar_score_20 = nil
    expect(patientHistory).to have(1).errors_on(:apgar_score_20)
  end

end
