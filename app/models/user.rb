class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable

  has_many :user_patients, :through => :admissions, :source => :patient
  has_many :admissions
  has_many :tpns
  belongs_to :hospital

  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable, :confirmable
  validates :name, :roles_mask, :residence_telephone, :presence => true
  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :address, :city, :pincode, :residence_telephone, :emergency_telephone, :mobile_number, :additional_detail, :roles_mask
  validate :user_count_within_limit, :on => :create

  def reset_email
    self.confirmed_at = nil
    self.save!
    self.send_confirmation_instructions
  end

  scope :with_role, lambda { |role| {:conditions => "roles_mask & #{2**Role.index(role.to_s)} > 0"} }
  scope :by_role, lambda{|role_mask| {:conditions => "roles_mask = #{role_mask}"}}

  scope :doctors, by_role(DOCTOR)
  scope :nutritionists, by_role(NUTRITIONIST)

  def role=(role)
    self.roles_mask=role
  end


  def role?(role)
    self.roles_mask == role
  end
  before_validation(:on => :create) do
    self.password = SecureRandom.base64(6) if self.password.nil?
  end
  
  def user_count_within_limit
    if self.role?(DOCTOR)
      if self.hospital.users.where(:roles_mask => "2").size >= self.hospital.doctors_count
        errors.add(:base,"Exceeded no. of Doctors")
      end
    elsif self.role?(NUTRITIONIST)
      if self.hospital.users.where(:roles_mask => "3").size >= self.hospital.nutritionists_count
        errors.add(:base,"Exceeded no. of Nutritionists")
      end
    end
  end
  
end

