class TpnAdditive < ActiveRecord::Base
  belongs_to :investigation
  validates :investigation_id, uniqueness: true
  
  # returns all TpnAdditive till date
  scope :to_date, lambda {|date|
    joins("join investigations on investigations.id = tpn_additives.investigation_id"). 
    where("investigations.investigated_on < ?",date)
  }
  # join on investigation, tpn-additives, for a patient.id
  scope :for_patient, lambda {|patient|
    joins("join investigations on investigations.id = tpn_additives.investigation_id"). 
    where("investigations.patient_id = ?",patient.id)
  } 
end
