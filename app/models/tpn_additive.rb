class TpnAdditive < ActiveRecord::Base
  belongs_to :investigation
  validates :investigation_id, presence: true, uniqueness: true

  scope :to_date, lambda {|date|
    joins("join investigations on investigations.id = tpn_additives.investigation_id"). 
    where("investigations.investigated_on < ?",date)
  }
  scope :for_patient, lambda {|patient|
    joins("join investigations on investigations.id = tpn_additives.investigation_id"). 
    where("investigations.patient_id = ?",patient.id)
  } 
end
