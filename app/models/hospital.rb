class Hospital < ActiveRecord::Base
  attr_accessible :name, :doctors_count, :nutritionists_count, :patients_count, :users_attributes
  extend FriendlyId

  friendly_id :name, use: :slugged

  has_and_belongs_to_many :users
  has_many :patients, :dependent => :destroy
  accepts_nested_attributes_for :users

  validates :name, uniqueness: true
end
