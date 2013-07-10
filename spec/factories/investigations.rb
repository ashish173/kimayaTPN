FactoryGirl.define do 
  factory :investigation do
    investigated_on   Date.today 
    association       :patient
  end
end
