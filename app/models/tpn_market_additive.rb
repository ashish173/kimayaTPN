class TpnMarketAdditive < ActiveRecord::Base
  has_many :tpn
  validates_presence_of :name, :message => :additive_name_blank
  validates_presence_of :market_name, :message => :market_name_blank
  validates_presence_of :unit, :message => :unit_blank
  validates_numericality_of :constant, :message => :constant_invalid

  scope :by_name, lambda{|name| {:conditions => "name = '#{name}'"}}

  scope :amino_acid, by_name('Amino Acid')
  scope :sodium_chloride, by_name('Sodium Chloride')
  scope :potassium_chloride, by_name('Potassium Chloride')
  scope :calcium, by_name('Calcium')
  scope :magnesium, by_name('Magnesium')

end
