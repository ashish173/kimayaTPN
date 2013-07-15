FactoryGirl.define do
  factory :user do
    sequence(:email) { |name| "ashish#{name}@gmail.com" }
    name "ashish"
    password "asdkljdf"


    after(:build) do |user|
      user.hospitals = [FactoryGirl.create(:hospital)]
      user.role= Role.find_by_name('Doctor')
    end
  end

end
