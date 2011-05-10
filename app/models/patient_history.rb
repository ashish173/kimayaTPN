class PatientHistory < ActiveRecord::Base
  belongs_to :patient
  validates_presence_of :gestational_age
end
