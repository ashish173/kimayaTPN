FactoryGirl.define do 
  factory :investigation do
    investigated_on   DateTime.now
    association       :patient
  end
end
