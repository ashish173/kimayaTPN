class Admission < ActiveRecord::Base
  belongs_to :patient
  belongs_to :user
  belongs_to :hospital

  validates :admitted_on, :hospital_id, :patient_id, :user_id, :presence => true  

  validate do |admission|
    return unless errors.empty?
    admission.validate_admitted_on
  end





  def validate_admitted_on
    if admitted_on < self.patient.date_of_birth || admitted_on > Date.today
      errors.add(:admitted_on, "Date should be between DOB and today's date.")
    end
  end

end

