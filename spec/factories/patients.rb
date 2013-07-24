FactoryGirl.define do
  factory :patient do
    sequence(:name)                 {|n| "patient#{n}"}
    sequence(:registration_number)  {|n| "#{n}"}
    date_of_birth                   Date.yesterday
    gender_id                       2 # Gender.find_by_name("Single Male")
     
    birth_weight                    1.5 
    address                         "pune"
    association                     :hospital, factory: :hospital
  end
end
