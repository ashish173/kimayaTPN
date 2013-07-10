class BloodSugarMonitor < ActiveRecord::Base
  belongs_to :investigation
  validates :investigation_id, presence: true
end
