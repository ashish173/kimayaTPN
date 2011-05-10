class Electrolyte < ActiveRecord::Base
  belongs_to :investigation
  validates_presence_of :sodium
end
