class MotherHistory < ActiveRecord::Base
  belongs_to :patient
  has_many :medical_histories, :depedent => :destory
end
