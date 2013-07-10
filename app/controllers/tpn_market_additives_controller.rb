class TpnMarketAdditivesController < ApplicationController

  def show
    additive = params[:id]
    case additive
      when 'amino_acid'
        @tpn_market_additives = TpnMarketAdditive.amino_acid
      when 'sodium_chloride'
        @tpn_market_additives = TpnMarketAdditive.sodium_chloride
    end
  end
end
