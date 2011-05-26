class Investigation < ActiveRecord::Base

  self.per_page = 10
  belongs_to :patient
  has_one :blood_analysis, :dependent => :destroy
  has_one :diagnosis, :dependent => :destroy
  has_one :biochemistry_assessment, :dependent => :destroy
  has_one :electrolyte, :dependent => :destroy
  has_one :tpn_additive, :dependent => :destroy
  has_one :enteral_diagnosis, :dependent => :destroy
  has_one :anthropometric_measurement, :dependent => :destroy
  has_many :blood_sugar_monitors, :dependent => :destroy

  accepts_nested_attributes_for :blood_analysis, :allow_destroy => true
  accepts_nested_attributes_for :diagnosis, :allow_destroy => true
  accepts_nested_attributes_for :biochemistry_assessment, :allow_destroy => true
  accepts_nested_attributes_for :electrolyte, :allow_destroy => true
  accepts_nested_attributes_for :tpn_additive, :allow_destroy => true
  accepts_nested_attributes_for :enteral_diagnosis, :allow_destroy => true
  accepts_nested_attributes_for :anthropometric_measurement, :allow_destroy => true
  accepts_nested_attributes_for :blood_sugar_monitors, :allow_destroy => true


  validates :investigated_on, :presence => true
  validates_uniqueness_of :investigated_on, :scope => [:patient_id],:message => :investigation_exists
  
  scope :day, lambda { |date| {:conditions => ["investigated_on = ?", date]} }
  
  scope :today, day(Date.today)
  
  scope :patient, lambda { |id| {:conditions => ["patient_id = ?", id]} }
  
  scope :from_date, lambda { |date| {:conditions => ["investigated_on >= ?", date]} }
  
  scope :to_date, lambda { |date| {:conditions => ["investigated_on <= ?", date]} }

  scope :for_user, lambda {|user|
    joins("join admissions on admissions.patient_id = investigations.patient_id").
    where("admissions.user_id =?", user.id)
  }
end
