class Investigation < ActiveRecord::Base
  belongs_to :patient
  has_one :blood_analysis
  has_one :diagnosis
  has_one :biochemistry_assessment
  has_one :electrolyte
  has_one :tpn_additive
  has_one :enteral_diagnosis
  has_one :anthropometric_measurement
  has_many :blood_sugar_monitors

  accepts_nested_attributes_for :blood_analysis
  accepts_nested_attributes_for :diagnosis
  accepts_nested_attributes_for :biochemistry_assessment
  accepts_nested_attributes_for :electrolyte
  accepts_nested_attributes_for :tpn_additive
  accepts_nested_attributes_for :enteral_diagnosis
  accepts_nested_attributes_for :anthropometric_measurement
  accepts_nested_attributes_for :blood_sugar_monitors


  validates :investigated_on, :presence => true
  
  scope :day, lambda { |date| {:conditions => ["investigated_on = ?", date]} }
  scope :today, day(Date.today)
  scope :patient, lambda { |id| {:conditions => ["patient_id = ?", id]} }
  scope :from_date, lambda { |date| {:conditions => ["investigated_on >= ?", date]} }
end
