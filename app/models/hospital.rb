class Hospital < ActiveRecord::Base
  attr_accessible :name, :doctors_count, :nutritionists_count, :patients_count, :users_attributes
  has_many :users, :dependent => :destroy
  has_many :patients, :dependent => :destroy
  has_many :investigations, :dependent => :destroy
  has_many :tpns
  has_many :admissions, :dependent => :destroy
  has_many :mother_history, :through => :patients
  has_many :reports, :dependent => :destroy
  accepts_nested_attributes_for :users

end
