class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name, :address, :city, :pincode, :residence_telephone,
    :emergency_telephone, :mobile_number, :additional_detail, :role_id
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :invitable, :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_many :user_patients, :through => :admissions, :source => :patient
  has_many :admissions
  has_many :tpns
  has_and_belongs_to_many :hospitals
  belongs_to :role
  validates :name, :role_id, :presence => true
  #validates :residence_telephone, presence: true, on: :update
  # Setup accessible (or protected) attributes for your model

  # validate :user_count_within_limit, :on => :create

  scope :by_role, lambda{|role_id| where(:role_id => role_id)}

  scope :doctors, by_role(DOCTOR)
  scope :nutritionists, by_role(NUTRITIONIST)



  def role?(role)
    role.id == role
  end
  
  def admin?
    role?(ADMIN)
  end

  def doctor?
    role?(DOCTOR)
  end

  def nutritionist?
   role?(NUTRITIONIST)
  end

  def current_hospital
    hospitals.first
  end
  
  def user_count_within_limit
    if doctor?
      errors.add(:base,"Exceeded no. of Doctors. Please contact administrator") if hospitals.users.doctors.size >= hospitals.doctors_count
    elsif nutritionist?
      errors.add(:base,"Exceeded no. of Nutritionists. Please contact administrator") if hospitals.users.nutritionists.size >= hospitals.nutritionists_count
    end
  end
end

