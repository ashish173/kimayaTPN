FactoryGirl.define do
  factory :patientHistory do
    patient_id 12
    gestational_age 12
    ga 2
    mode_of_delivery "normal"
    rupture_of_membranes "normal"
    apgar_score_1 "1"
    apgar_score_5 "2"
    apgar_score_20 "3"
  end
end
