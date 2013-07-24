class Investigation < ActiveRecord::Base

  self.per_page = 10

  belongs_to :patient
  belongs_to :hospital
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

  #validates :patient_id, :presence => true
  validates :investigated_on, :presence => true
  validates :investigated_on, :timeliness => {:on_or_before => lambda {Date.current }, :type => :date }
  validates :investigated_on, :uniqueness => { :scope => :patient_id }
  
  scope :day, lambda {|date| where("DATE(investigated_on) = ?", date) }
  
  scope :today, day(Date.today)
  
  scope :patient, lambda { |id| where(patient_id: id) }
  
  scope :between_date, lambda { |sdate, edate| where("DATE(investigated_on) between ? and ?", sdate, edate) }
  
  scope :for_user, lambda {|user|
    joins("join admissions on admissions.patient_id = investigations.patient_id").
    where("admissions.user_id =?", user.id)
  }

  scope :ordered, order("investigated_on DESC")

end
