FactoryGirl.define do
  factory :role_admin, class: Role do
    name 'Admin'
  end
  factory :role_doctor, class: Role  do
    name 'Doctor'
  end
  factory :role_nutritionist, class: Role  do
    name 'Nutritionist'
  end
  factory :role_patient, class: Role  do
    name 'Patient'
  end
end
