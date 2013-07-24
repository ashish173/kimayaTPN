module TpnsHelper
 
  def final_tpn_infusion
    ((@result.tpn_vol / 24) - @tpn.tpn_infusion.feed_volume_over_24_hour - @tpn.tpn_infusion.arterial_line_infusion - @tpn.tpn_infusion.inotrope_infusion - @tpn.tpn_infusion.inotrope_infusion - @tpn.tpn_infusion.other_infusion).round(2)
  end

end
