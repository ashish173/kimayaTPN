FactoryGirl.define do 
  factory :tpn_infusion do
    feed_volume_over_24_hour "23"
    arterial_line_infusion "line infusion"
    other_infusion "others"
    # association :tpn

  end
end
