class TpnInfusion < ActiveRecord::Base
  attr_accessible :feed_volume_over_24_hour, :arterial_line_infusion, :inotrope_infusion, :other_infusion
  belongs_to :tpn
  validates :tpn_id, :uniqueness => true   # has_one relationship with tpn so uniqueness on tpn_id
   
end
