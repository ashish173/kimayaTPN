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
  validates :sodium_chloride, :calcium, :numericality => { :greater_than_or_equal_to => 0, :less_than_or_equal_to => 10 }
  validates :potassium_chloride, :numericality => { :greater_than_or_equal_to => 0, :less_than_or_equal_to => 8 }
  validates :magnesium, :numericality => { :greater_than_or_equal_to => 0, :less_than_or_equal_to => 2 }
  validates :patient_id, :presence => true
  validates :fat_volume, :numericality => { :greater_than_or_equal_to => 0, :less_than_or_equal_to => 4 }

  validates_inclusion_of :fat_concentration, :in => [10,20], :allow_nil => false
  validates_inclusion_of :factor, :in => [1.0,1.1,1.2,1.3,1.4,1.5], :allow_nil => false
  has_one :tpn_infusion
  
  after_initialize :init

  scope :doctors, lambda { |current_user|
    if current_user.admin?
      return current_user.hospital.users.doctors
    elsif current_user.doctor?
      return [current_user.name]
    end
  }

  def build_tpn
    tpn = Kimaya::TPNCalc.new do |tpn|
      tpn.current_weight               = self.current_weight 
      tpn.percent_dextrose_conc        = self.dextrose_conc / 100   
      tpn.total_fluid_intake           = self.total_fluid_intake 
      tpn.fat_intake                   = self.fat_volume
      tpn.lipid_conc                   = self.fat_concentration / 100
      tpn.overfill_factor              = self.factor
      tpn.amino_acid_intake            = self.amino_acid
      tpn.amino_acid_conc              = TpnMarketAdditive.find(self.amino_acid_additive_id).constant / 100
      tpn.sodium_chloride_intake       = self.sodium_chloride
      tpn.sodium_chloride_conc         = TpnMarketAdditive.find(self.sodium_chloride_additive_id).constant
      tpn.potassium_chloride_intake    = self.potassium_chloride
      tpn.potassium_chloride_conc      = TpnMarketAdditive.find(self.potassium_chloride_additive_id).constant
      tpn.magnesium_intake             = self.magnesium
      tpn.magnesium_conc               = TpnMarketAdditive.find(self.magnesium_additive_id).constant
      tpn.calcium_intake               = self.calcium
      tpn.calcium_conc                 = TpnMarketAdditive.find(self.calcium_additive_id).constant
      tpn.administration               = self.administration
    end
    p tpn.calculate_tpn
  end

  def init
    if new_record?
      self.day_of_tpn        ||= 1
      self.current_weight    ||= 0.00
      self.dextrose_conc     ||= 10.00
      self.total_fluid_intake||= 0.00
      self.fat_volume        ||= 0.00
      self.fat_concentration ||= 10.00
      self.factor            ||= 1.0
      self.amino_acid        ||= 0.00
      self.sodium_chloride   ||= 0.00
      self.potassium_chloride||= 0.00
      self.calcium           ||= 0.00
      self.magnesium         ||= 0.00
      self.amino_acid_additive_id ||= TpnMarketAdditive.amino_acid.first.id
      self.sodium_chloride_additive_id ||= TpnMarketAdditive.sodium_chloride.first.id
      self.potassium_chloride_additive_id ||= TpnMarketAdditive.potassium_chloride.first.id
      self.calcium_additive_id ||= TpnMarketAdditive.calcium.first.id
      self.magnesium_additive_id ||= TpnMarketAdditive.magnesium.first.id 
    end
  end

end
