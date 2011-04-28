=begin
      t.references :patient
      t.float :current_weight
      t.integer :day_of_tpn
      t.float :dextrose_conc
      t.datetime :tpn_date
      t.string :administration
      t.float :total_fluid_intake
      t.float :feed_volume
      t.float :fat_volume
      t.float :fat_concentration
      t.float :factor
      t.float :losses
      t.float :amino_acid
      t.float :sodium_chloride
      t.float :potassium_chloride
      t.float :calcium
      t.float :magnesium
      t.float :mvi
      t.integer :amino_acid_additive_id
      t.integer :sodium_chloride_additive_id
      t.integer :potassium_chloride_additive_id
      t.integer :calcium_additive_id
      t.integer :magnesium_additive_id
      t.float :heparin
=end

class Tpn < ActiveRecord::Base
  belongs_to :patient
  belongs_to :amino_acid_additive, :class_name => "TpnMarketAdditives", :foreign_key => :amino_acid_additive_id
  belongs_to :sodium_chloride_additive, :class_name => "TpnMarketAdditives", :foreign_key => :sodium_chloride_additive_id
  belongs_to :potassium_chloride_additive, :class_name => "TpnMarketAdditives", :foreign_key => :potassium_chloride_additive_id
  belongs_to :calcium_additive, :class_name => "TpnMarketAdditives", :foreign_key => :calcium_additive_id
  belongs_to :magnesium_additive, :class_name => "TpnMarketAdditives", :foreign_key => :magnesium_additive_id
  validates_numericality_of :dextrose_conc, :greater_than_or_equal_to => 5, :less_than_or_equal_to => 20
  validates_numericality_of :total_fluid_intake, :greater_than_or_equal_to => 40, :less_than_or_equal_to => 250
  validates_numericality_of :day_of_tpn, :only_integer => true, :greater_than => 0
  validates_numericality_of :current_weight, :greater_than => 0
  validates_numericality_of :losses
  validates_numericality_of :fat_volume
  validates_numericality_of :fat_concentration
end
