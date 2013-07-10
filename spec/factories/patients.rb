FactoryGirl.define do
  factory :patient do
    sequence(:name)                 {|n| "patient#{n}"}
    sequence(:registration_number)  {|n| "#{n}"}
    date_of_birth                   Date.today
    gender_id                       "23"
    birth_weight                    1.5 
    address                         "pune"
    association                     :hospital
  end
end
