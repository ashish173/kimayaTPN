class PatientHistory < ActiveRecord::Base
  belongs_to :patient
  validates :patient_id, :gestational_age, :ga, :mode_of_delivery, :rupture_of_membranes, :apgar_score_1, :apgar_score_5, :apgar_score_20, :presence =>true
end
