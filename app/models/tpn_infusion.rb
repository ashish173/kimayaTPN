class TpnInfusion < ActiveRecord::Base
  attr_accessible :feed_volume_over_24_hour, :arterial_line_infusion, :inotrope_infusion, :other_infusion
  belongs_to :tpn
  after_initialize :init

  private
    def init
      if new_record?
        self.feed_volume_over_24_hour ||= 0
        self.arterial_line_infusion   ||= 0
        self.inotrope_infusion        ||= 0
        self.other_infusion           ||= 0
      end
    end
end
