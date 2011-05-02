class AdditivesController < ApplicationController

  layout 'user'

  def index
    @additives = TpnMarketAdditive.all.group_by(&:name)
  end

  def new 
    @additives = TpnMarketAdditive.find(:all, :select => [:id,:name,:constant,:unit]).to_json
    @additive = TpnMarketAdditive.new
    render :layout => false
  end 

  def edit
    @additive = TpnMarketAdditive.find(params[:id])
    respond_to do |format|
      format.html{render :layout => false}
    end
  end

  def create
    @additive = TpnMarketAdditive.new(params[:tpn_market_additive])
    respond_to do |format|
      if @additive.save
        flash[:notice] = "New Market Additive." 
        format.js {
          render :js => "window.location='#{additives_path}'"
        }   
      else
        format.js {render :partial => 'new'}
      end 
    end 

  end 

  def update
    @additive = TpnMarketAdditive.find(params[:id])
    @additive.attributes = params[:tpn_market_additive]
    respond_to do |format|
      if @additive.save
        flash[:notice] = "Market Additive Updated Successfully" 
        format.js {
          render :js => "window.location='#{additives_path}'"
        }   
      else
        format.js {render :partial => 'edit'}
      end 
    end
  end

  def destroy
    TpnMarketAdditive.find(params[:id]).destroy
    #.destroy
    respond_to do |format|
      format.html{ redirect_to additives_path }
    end

  end

end
