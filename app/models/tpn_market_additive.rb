class TpnMarketAdditive < ActiveRecord::Base
  has_many :tpn
  validates :name, :market_name, :message, :presence => true
  validates :constant, :numericality => true

  scope :by_name, lambda{|name| {:conditions => "name = '#{name}'"}}

  scope :amino_acid, by_name('Amino Acid')
  scope :sodium_chloride, by_name('Sodium Chloride')
  scope :potassium_chloride, by_name('Potassium Chloride')
  scope :calcium, by_name('Calcium')
  scope :magnesium, by_name('Magnesium')

end
