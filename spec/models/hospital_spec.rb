require 'spec_helper'

describe Hospital do
  
 # let(:hospital){Hospital.create(name:"ruby",patients_count:1)}
 # let(:patient){Patient.create(gender_id: "24", name:"jill", registration_number:"101", date_of_birth:Date.today, birth_weight:5,
                               #address:"pune",hospital_id:2)}
  
  it "should have a unique name" do
    create(:hospital, name: "ruby")
    expect(build(:hospital, name: "ruby")).to have(1).errors_on(:name)
  end

  it "should have patients within its limit if specified" do 
    p1= create(:patient)
    expect(build(:patient, hospital: p1.hospital)).to_not be_valid
  end

end
