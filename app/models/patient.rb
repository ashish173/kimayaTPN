class Patient < ActiveRecord::Base
  self.per_page =10
  validates :registration_number, :uniqueness => true
  validates :registration_number, :name, :date_of_birth, :address, :gender_id, :birth_weight, :presence => true
  validates_date :date_of_birth, :on_or_before => lambda{ Date.today } 
  validates :birth_weight, :numericality => true
  validate :patient_count_within_limit, :on => :create

  has_one :mother_history, :dependent => :destroy
  has_one :patient_history, :dependent => :destroy
  has_many :investigations, :dependent => :destroy
  has_many :daily_tpn_additives, :through => :investigations, :source => :tpn_additive
  has_many :tpns
  has_one :admission, :dependent => :destroy
  belongs_to :hospital
  belongs_to :gender

  validates :hospital_id, :presence=>true

  accepts_nested_attributes_for :mother_history, :allow_destroy => true 
  accepts_nested_attributes_for :patient_history, :allow_destroy => true
  accepts_nested_attributes_for :admission, :allow_destroy => true

  scope :for_user, lambda {|user|
    joins("join admissions on admissions.patient_id = patients.id").
      where("admissions.user_id =?", user.id)
  }

  scope :ordered, joins(:admission).order("admissions.admitted_on DESC")

  scope :search, lambda{|keyword| where("registration_number like ? or name like ?", "#{keyword}%", "%#{keyword}%")}
  
  def patient_count_within_limit
    if self.hospital && self.hospital.patients.count >= self.hospital.patients_count.to_i 
      if self.hospital.patients_count!=nil
        errors.add(:base,"Exceeded no of Patients")
    end
  end 
  end
end

