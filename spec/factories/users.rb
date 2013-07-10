FactoryGirl.define do
  factory :user do
    sequence(:email) { |name| "ashish#{name}@gmail.com" }
    name "ashish"
    role_id 2
    password "asdkljdf"
    association :hospital
  end

end
