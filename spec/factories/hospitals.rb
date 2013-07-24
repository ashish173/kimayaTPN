FactoryGirl.define do
  factory :hospital do
    sequence(:name)         {|n| "hospital#{n}"}
    patients_count          2
    nutritionists_count     2
    doctors_count           2
  end
end