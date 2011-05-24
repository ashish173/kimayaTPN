class Patient < ActiveRecord::Base
 validates_uniqueness_of :registration_number, :message => :registration_number_not_unique
 validates_presence_of :registration_number, :message => :registration_number_blank
 validates_presence_of :name, :message => :patient_name_blank
 validates_presence_of :date_of_birth, :message => :date_of_birth_blank
 validates_numericality_of :birth_weight, :message => :birth_weight_invalid
 validates_presence_of :address, :message => :address_blank
 validates_presence_of :gender_id, :message => :gender_id_blank
 validates_presence_of :emergency_telephone, :message => :phone_number_blank

 has_one :mother_history, :dependent => :destroy
 has_one :patient_history, :dependent => :destroy
 has_many :investigations
 has_many :daily_tpn_additives, :through => :investigations, :source => :tpn_additive

 has_one :admission

 accepts_nested_attributes_for :mother_history
 accepts_nested_attributes_for :patient_history
 accepts_nested_attributes_for :admission

 scope :for_user, lambda {|user|
   joins("join admissions on admissions.patient_id = patients.id").
     where("admissions.user_id =?", user.id)
 }

end
