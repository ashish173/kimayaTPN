class TpnsController < ApplicationController
  def new 
    @value = Tpn.new 
    @market_names = TpnMarketAdditive.all.group_by(&:name).to_json
    render :layout => false
  end
end
