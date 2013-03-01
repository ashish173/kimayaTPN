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
  validates :fat_volume, :fat_concentration, :numericality => true 
  validates :amino_acid, :numericality => { :greater_than_or_equal_to => 0.5, :less_than_or_equal_to => 3.5 }
  validates :sodium_chloride, :calium, :numericality => { :greater_than_or_equal_to => 0, :less_than_or_equal_to => 10 }
  validates :potassium_chloride, :numericality => { :greater_than_or_equal_to => 0, :less_than_or_equal_to => 8 }
  validates :magnesium, :numericality => { :greater_than_or_equal_to => 0, :less_than_or_equal_to => 2 }
  validates :patient, :presence => true
  validates :fat_volume, :numericality => { :greater_than_or_equal_to => 0, :less_than_or_equal_to => 4 }

  validates_inclusion_of :fat_concentration, :in => [10,20], :allow_nil => false
  validates_inclusion_of :factor, :in => [1.0,1.1,1.2,1.3,1.4,1.5], :allow_nil => false
  has_one :tpn_infusion
  scope :doctors, lambda { |current_user|
    if current_user.admin?
      return current_user.hospital.users.doctors
    elsif current_user.doctor?
      return [current_user.name]
    end
  }

  def build_tpn
    
    amino_acid_concentration =  self.amino_acid_additive.present? ? self.amino_acid_additive.constant : TpnMarketAdditive.amino_acid.first.present? ? TpnMarketAdditive.amino_acid.first.constant : 0
    
    sodium_chloride_concentration = self.sodium_chloride_additive.present? ? self.sodium_chloride_additive.constant : TpnMarketAdditive.sodium_chloride.first.present? ? TpnMarketAdditive.sodium_chloride.first.constant : 0
    
    potassium_chloride_concentration = self.potassium_chloride_additive.present? ? self.potassium_chloride_additive.constant : TpnMarketAdditive.potassium_chloride.first.present? ? TpnMarketAdditive.potassium_chloride.first.constant : 0
    
    magnesium_concentration = self.magnesium_additive.present? ? self.magnesium_additive.constant : TpnMarketAdditive.magnesium.first.present? ? TpnMarketAdditive.magnesium.first.constant : 0
    
    calcium_concentration = self.calcium_additive.present? ? self.calcium_additive.constant : TpnMarketAdditive.calcium.first.present? ? TpnMarketAdditive.calcium.first.constant : 0
    
    params = { current_weight: self.current_weight.to_f, percent_dextrose_conc: self.dextrose_conc.to_f / 100, total_fluid_intake: self.total_fluid_intake.to_f, fat_intake: self.fat_volume.to_f,  lipid_conc: self.fat_concentration.to_f, overfill_factor: self.factor.to_f, amino_acid_intake: self.amino_acid.to_f, amino_acid_conc: amino_acid_concentration / 100, sodium_chloride_intake: self.sodium_chloride.to_f, sodium_chloride_conc: sodium_chloride_concentration, potassium_chloride_intake: self.potassium_chloride.to_f, potassium_chloride_conc: potassium_chloride_concentration, magnesium_intake: self.magnesium.to_f, magnesium_conc: magnesium_concentration, calcium_intake: self.calcium.to_f, calcium_conc: calcium_concentration }
    tpn = Kimaya::TPNCalc.new(params)
    tpn.calculate_tpn
    tpn
  end
end
