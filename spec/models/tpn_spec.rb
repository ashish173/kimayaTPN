require 'spec_helper'

describe  Tpn do
  it "is invalid for dextrose_conc outside 5-20" do
    tpn = Tpn.create(dextrose_conc: 1, total_fluid_intake: 45,
      day_of_tpn: 2, current_weight: 2, fat_concentration: 12,
      fat_volume: 14, patient_id: 2)
    expect(tpn).to have(1).errors_on(:dextrose_conc)
  end
  
  it "is invalid for dextrose_conc not a number" do
    tpn = Tpn.create(dextrose_conc: "1", total_fluid_intake: 45,
      day_of_tpn: 2, current_weight: 2, fat_concentration: 12,
      fat_volume: 14, patient_id: 2)
    expect(tpn).to have(1).errors_on(:dextrose_conc)
  end
  it "is invalid for total_fluid_intake outside 40-150" do
    tpn = Tpn.create(dextrose_conc: 1, total_fluid_intake: 35,
      day_of_tpn: 2, current_weight: 2, fat_concentration: 12,
      fat_volume: 14, patient_id: 2)
    expect(tpn).to have(1).errors_on(:total_fluid_intake)
  end

  it "is invalid for total_fluid_intake not a number" do
    tpn = Tpn.create(dextrose_conc: 1, total_fluid_intake: "45",
      day_of_tpn: 2, current_weight: 2, fat_concentration: 12,
      fat_volume: 14, patient_id: 2)
    expect(tpn).to have(1).errors_on(:dextrose_conc)
  end

  it "is invalid if day_of_tpn not a number" do
    tpn = Tpn.create(dextrose_conc: 1, total_fluid_intake: "45",
      day_of_tpn: "as", current_weight: 2, fat_concentration: 12,
      fat_volume: 14, patient_id: 2)
    expect(tpn).to have(1).errors_on(:day_of_tpn) 
  end

  it "is invalid for day_of_tpn less than 0" do
    tpn = Tpn.create(dextrose_conc: 1, total_fluid_intake: "45",
      day_of_tpn: -1, current_weight: 2, fat_concentration: 12,
      fat_volume: 14, patient_id: 2)
    expect(tpn).to have(1).errors_on(:day_of_tpn) 
  end

  it "is invalid for current_weight less than 0" do
    tpn = Tpn.create(dextrose_conc: 1, total_fluid_intake: "45",
      day_of_tpn: 2, current_weight: -1, fat_concentration: 12,
      fat_volume: 14, patient_id: 2)
    expect(tpn).to have(1).errors_on(:current_weight) 
  end

  it "is invalid for current_weight not a number" do
    tpn = Tpn.create(dextrose_conc: 1, total_fluid_intake: "45",
      day_of_tpn: -1, current_weight: "as", fat_concentration: 12,
      fat_volume: 14, patient_id: 2)
    expect(tpn).to have(1).errors_on(:current_weight) 
  end

  it "is invalid for fat_volume not a number" do
    tpn = Tpn.create(dextrose_conc: 1, total_fluid_intake: "45",
      day_of_tpn: -1, current_weight: "as", fat_concentration: 12,
      fat_volume: "false value", patient_id: 2)
    expect(tpn).to have(1).errors_on(:fat_volume) 
  end
  it "is invalid without a patient" do
    tpn = Tpn.create(dextrose_conc: 1, total_fluid_intake: "45",
      day_of_tpn: -1, current_weight: "as", fat_concentration: 12,
      fat_volume: 14)
    expect(tpn).to have(1).errors_on(:patient_id)
  end

  it "is invalid without a user" do
    tpn = Tpn.create(dextrose_conc: 1, total_fluid_intake: "45",
      day_of_tpn: -1, current_weight: "as", fat_concentration: 12,
      fat_volume: 14)
    expect(tpn).to have(1).errors_on(:user_id)

  end
  it "is invalid without a hospital " do
    tpn = Tpn.create(dextrose_conc: 1, total_fluid_intake: "45",
      day_of_tpn: -1, current_weight: "as", fat_concentration: 12,
      fat_volume: 14)
    expect(tpn).to have(1).errors_on(:user_id)
  end

end
