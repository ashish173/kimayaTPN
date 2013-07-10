class Diagnosis < ActiveRecord::Base
  belongs_to :investigation
  validates :investigation_id, presence: true, uniqueness: true

end
