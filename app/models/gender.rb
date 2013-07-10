class Gender < ActiveRecord::Base
  has_many :patients
end
