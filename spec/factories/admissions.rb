FactoryGirl.define do
  factory :admission do
    admitted_on Date.today
    association :patient
    association :user
    association :hospital
  end
end
