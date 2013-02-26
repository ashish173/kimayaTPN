class TpnInfusionsController < ApplicationController
  def create
    @tpn = Tpn.find(params[:tpn_infusion][:tpn_id])
    @tpn_infusion = @tpn.build_tpn_infusion(params[:tpn_infusion])
    if @tpn_infusion.save
      render 'tpn_infusion', :formats => [:js]
    end
  end
end
