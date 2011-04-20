class TpnsController < ApplicationController
  def new 
    @value = Tpn.new 
    render :layout => false
  end
end
