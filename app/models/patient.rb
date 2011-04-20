
=begin
t.integer :gender_id
  t.string :name
  t.integer :registration_number
  t.datetime :date_of_birth
  t.float :birth_weight
  t.string :address
  t.string :city
  t.string :pincode
  t.string :state
  t.string :residence_telephone
  t.string :emergency_telephone
  t.string :mobile_number
  t.string :additional_detail
  t.timestamps
=end
class Patient < ActiveRecord::Base
 validates_numericality_of :registration_number, :message => :registration_number_invalid
 validates_presence_of :name, :message => :patient_name_blank
 validates_presence_of :date_of_birth, :message => :date_of_birth_blank
 validates_numericality_of :birth_weight, :message => :birth_weight_invalid
 validates_presence_of :address, :message => :address_blank
 validates_presence_of :gender_id, :message => :gender_id_blank
 validates_format_of  :emergency_telephone, :with =>  /^(\d{3}-){2}\d{4}$/, :message => :phone_number_invalid
 validates_format_of  :residence_telephone, :with =>  /^(\d{3}-){2}\d{4}$/, :allow_blank => true, :message => :phone_number_invalid
 validates_format_of :mobile_number, :with =>  /^\d{10}/, :allow_blank => true, :message => :mobile_number_invalid
end
