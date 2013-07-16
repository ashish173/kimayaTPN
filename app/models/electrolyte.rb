class Electrolyte < ActiveRecord::Base
  belongs_to :investigation
  validates :investigation_id, uniqueness: true
end
