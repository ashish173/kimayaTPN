require 'spec_helper'

describe  Tpn do
  
  it "is invalid for dextrose_conc outside 5-20" do
    expect(build(:tpn, dextrose_conc: 1)).to have(1).errors_on(:dextrose_conc)
  end
  
  it "is invalid for dextrose_conc not a number" do
    expect(build(:tpn, dextrose_conc: "qw")).to have(1).errors_on(:dextrose_conc)
  end
  it "is invalid for total_fluid_intake outside 40-150" do
    expect(build(:tpn, total_fluid_intake: 30)).to have(1).errors_on(:total_fluid_intake)
  end

  it "is invalid for total_fluid_intake not a number" do

    expect(build(:tpn, total_fluid_intake: "some quant" )).to have(1).errors_on(:total_fluid_intake)
  end

  it "is invalid if day_of_tpn not a number" do
    expect(build(:tpn, day_of_tpn: "some days")).to have(1).errors_on(:day_of_tpn) 
  end

  it "is invalid for day_of_tpn less than 0" do
    expect(build(:tpn, day_of_tpn: -1)).to have(1).errors_on(:day_of_tpn) 
  end

  it "is invalid for current_weight less than 0" do
    expect(build(:tpn, current_weight: -1)).to have(1).errors_on(:current_weight) 
  end

  it "is invalid for current_weight not a number" do
    expect(build(:tpn, current_weight: "as")).to have(1).errors_on(:current_weight) 
  end

  it "is invalid for fat_volume not a number" do
    expect(build(:tpn, fat_volume: "false value")).to have(1).errors_on(:fat_volume) 
  end
  it "is invalid without a patient" do
    expect(build(:tpn, patient_id: nil)).to have(1).errors_on(:patient_id)
  end

end
