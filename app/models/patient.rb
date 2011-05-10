class Patient < ActiveRecord::Base
 validates_uniqueness_of :registration_number, :message => :registration_number_not_unique
 validates_presence_of :registration_number, :message => :registration_number_blank
 validates_presence_of :name, :message => :patient_name_blank
 validates_presence_of :date_of_birth, :message => :date_of_birth_blank
 validates_numericality_of :birth_weight, :message => :birth_weight_invalid
 validates_presence_of :address, :message => :address_blank
 validates_presence_of :gender_id, :message => :gender_id_blank
 validates_format_of  :emergency_telephone, :with =>  /^\d{3}-\d{8}$/, :message => :phone_number_invalid
 validates_format_of  :residence_telephone, :with =>  /^\d{3}-\d{8}$/, :allow_blank => true, :message => :phone_number_invalid
 validates_format_of :mobile_number, :with =>  /^\d{10}/, :allow_blank => true, :message => :mobile_number_invalid

 has_one :mother_history, :dependent => :destroy
 has_one :patient_history, :dependent => :destroy
 has_many :investigations
 has_many :daily_tpn_additives, :through => :investigations, :source => :tpn_additive

 has_one :admission

 accepts_nested_attributes_for :mother_history
 accepts_nested_attributes_for :patient_history
 accepts_nested_attributes_for :admission
end
