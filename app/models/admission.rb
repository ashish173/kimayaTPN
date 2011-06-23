class Admission < ActiveRecord::Base
  belongs_to :patient
  belongs_to :user
  validates :admitted_on, :presence => true  
  validate do |admission|
    return unless errors.empty?
    admission.validate_admitted_on
  end

  def validate_admitted_on
    if admitted_on < patient.date_of_birth || admitted_on > Date.today
      errors.add(:admitted_on, "Date should be between DOB and today's date.")
      puts("")
    end
  end
end
