class Tpn < ActiveRecord::Base
  belongs_to :patient
  belongs_to :user
  belongs_to :hospital
  belongs_to :amino_acid_additive, :class_name => "TpnMarketAdditive", :foreign_key => :amino_acid_additive_id
  belongs_to :sodium_chloride_additive, :class_name => "TpnMarketAdditive", :foreign_key => :sodium_chloride_additive_id
  belongs_to :potassium_chloride_additive, :class_name => "TpnMarketAdditive", :foreign_key => :potassium_chloride_additive_id
  belongs_to :calcium_additive, :class_name => "TpnMarketAdditive", :foreign_key => :calcium_additive_id
  belongs_to :magnesium_additive, :class_name => "TpnMarketAdditive", :foreign_key => :magnesium_additive_id

  validates :dextrose_conc, :numericality => { :greater_than_or_equal_to => 5, :less_than_or_equal_to => 20 }
  validates :total_fluid_intake, :numericality => { :greater_than_or_equal_to => 40, :less_than_or_equal_to => 250 }
  validates :day_of_tpn, :numericality => { :only_integer => true, :greater_than => 0 }
  validates :current_weight, :numericality => { :greater_than => 0 }
  validates :losses, :fat_volume, :fat_concentration, :numericality => true 

  scope :doctors, lambda { |current_user|
    if current_user.admin?
      return current_user.hospital.users.doctors
    elsif current_user.doctor?
      return [current_user.name]
    end
  }
end
