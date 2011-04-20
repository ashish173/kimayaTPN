class Tpn < ActiveRecord::Base
  belongs_to :patient
  belongs_to :amino_acid_additive, :class_name => "TpnMarketAdditives", :foreign_key => :amino_acid_additive_id
  belongs_to :sodium_chloride_additive, :class_name => "TpnMarketAdditives", :foreign_key => :sodium_chloride_additive_id
  belongs_to :potassium_chloride_additive, :class_name => "TpnMarketAdditives", :foreign_key => :potassium_chloride_additive_id
  belongs_to :calcium_additive, :class_name => "TpnMarketAdditives", :foreign_key => :calcium_additive_id
  belongs_to :magnesium_additive, :class_name => "TpnMarketAdditives", :foreign_key => :magnesium_additive_id
end
