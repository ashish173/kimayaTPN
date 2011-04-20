class TpnMarketAdditive < ActiveRecord::Base
  has_many :tpn
  validates_presence_of :name, :message => :additive_name_blank
  validates_presence_of :market_name, :message => :market_name_blank
  validates_presence_of :unit, :message => :unit_blank
  validates_numericality_of :constant, :message => :constant_invalid
end
