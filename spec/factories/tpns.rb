FactoryGirl.define do
  factory :tpn do
    current_weight 2
    tpn_date Date.today
    total_fluid_intake 41
    amino_acid 1
    association :patient
    association :user
    association :hospital 
  end   
  
end
