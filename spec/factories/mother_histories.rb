FactoryGirl.define  do
  factory :motherHistory do
    g                       2.3
    p                       4.4
    a                       3.3
    maternal_usg            "234"
    age                     "27"
    pre_pregnancy_weight    ">40"
    height                  "145"
    toxemia                 "mild"
    diabetes                "IDDM"
    is_antenatal_steroids   "no"
    medical_history         "drugs"
    other_medical_problems  "none"
    association             :patient
  end
end




