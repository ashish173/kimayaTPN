FactoryGirl.define do
  factory :user do
    sequence(:email) { |name| "ashish#{name}@gmail.com" }
    name "ashish"
    password "asdkljdf"


    after(:build) do |user|
      user.hospitals = [FactoryGirl.create(:hospital)]
      user.role= FactoryGirl.create(:role_doctor)
    end
  end

end
