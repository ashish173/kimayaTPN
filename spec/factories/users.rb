FactoryGirl.define do
  factory :user do
    sequence(:email) { |name| "ashish#{name}@gmail.com" }
    name "ashish"
    role_id 14
    password "asdkljdf"
    #association :hospital
  
  after(:build) do |user|
    user.hospitals = [FactoryGirl.create(:hospital)]
  end
  
  end
end
