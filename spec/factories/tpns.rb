FactoryGirl.define do
  factory :tpn do
    total_fluid_intake 50
    dextrose_conc 15
    day_of_tpn 1
    current_weight 2
    fat_volume 12
    fat_concentration 13
    association :patient
    association :user
    association :hospital
    
=begin
    factory :tpn_with_tpn_infusion do
      after_create do |tpn|
        FactoryGirl.create(:tpn_infusion, tpn: tpn)
      end
    end


    after(:create) do |tpn|
      tpn.tpn_infusion = FactoryGirl.create(:tpn_infusion)
    end
=end    
  end   
  
end
