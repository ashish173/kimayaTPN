FactoryGirl.define do
  factory :user do
    sequence(:name) { |n| "#{n}singh" }
    role_id 2
    password "somepassword"
    sequence(:email) {|email| "#{email}myemail@gmail.com" }
  end
end
