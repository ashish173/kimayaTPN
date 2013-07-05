require 'spec_helper'

describe Admission do

  let(:admission){Admission.new()}
  let(:patient){Patient.new()}

  it "must have an admission date" do 
    admission.save
    admission.should_not be_valid

  end
 
end
