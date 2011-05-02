class Investigation < ActiveRecord::Base
  belongs_to :patient
  has_one :blood_analysis
  has_one :diagnosis
  has_one :biochemistry_assessment
  has_one :electrolyte
end
