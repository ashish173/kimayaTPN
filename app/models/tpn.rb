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
  belongs_to :user
  belongs_to :hospital
  belongs_to :amino_acid_additive, :class_name => "TpnMarketAdditives", :foreign_key => :amino_acid_additive_id
  belongs_to :sodium_chloride_additive, :class_name => "TpnMarketAdditives", :foreign_key => :sodium_chloride_additive_id
  belongs_to :potassium_chloride_additive, :class_name => "TpnMarketAdditives", :foreign_key => :potassium_chloride_additive_id
  belongs_to :calcium_additive, :class_name => "TpnMarketAdditives", :foreign_key => :calcium_additive_id
  belongs_to :magnesium_additive, :class_name => "TpnMarketAdditives", :foreign_key => :magnesium_additive_id
  validates :dextrose_conc, :numericality => { :greater_than_or_equal_to => 5, :less_than_or_equal_to => 20 }
  validates :total_fluid_intake, :numericality => { :greater_than_or_equal_to => 40, :less_than_or_equal_to => 250 }
  validates :day_of_tpn, :numericality => { :only_integer => true, :greater_than => 0 }
  validates :current_weight, :numericality => { :greater_than => 0 }
  validates :fat_volume, :fat_concentration, :numericality => true 
  scope :doctors, lambda { |current_user|
    if current_user.super_admin?
      return User.doctors
    elsif current_user.role.admin?
      return current_user.hospital.users.doctors
    elsif current_user.role.doctor?
      return [current_user.name]
    end
  }
  
  def build_tpn
    params = { current_weight: self.current_weight.to_f, percent_dextrose_conc: self.dextrose_conc.to_f / 100, total_fluid_intake: self.total_fluid_intake.to_f, fat_intake: self.fat_volume.to_f,  lipid_conc: self.fat_concentration.to_f, overfill_factor: self.factor.to_f, amino_acid_intake: self.amino_acid.to_f, amino_acid_conc: self.amino_acid_additive_id.to_f / 100, sodium_chloride_intake: self.sodium_chloride.to_f, sodium_chloride_conc: self.sodium_chloride_additive_id.to_f, potassium_chloride_intake: self.potassium_chloride.to_f, potassium_chloride_conc: self.potassium_chloride_additive_id.to_f, magnesium_intake: self.magnesium.to_f, magnesium_conc: self.magnesium_additive_id.to_f, calcium_intake: self.calcium.to_f, calcium_conc: calcium_additive_id.to_f }
  tpn = Kimaya::TPNCalc.new(params)
  tpn.calculate_tpn
  tpn
  end
end
