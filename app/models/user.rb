class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable

  has_many :user_patients, :through => :admissions, :source => :patient
  has_many :admissions

  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable, :confirmable
  validates_presence_of :name, :message => :user_name_blank
  validates_presence_of :email, :message => :email_blank
  validates :roles_mask, :presence => true
  validates_presence_of :residence_telephone, :message => :phone_number_blank
  # Setup accessible (or protected) attributes for your model
  attr_accessible :password, :email, :name, :address, :city, :pincode, :residence_telephone, :emergency_telephone, :mobile_number, :additional_detail, :roles_mask


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
    self.password = ActiveSupport::SecureRandom.base64(6) if self.password.nil?
  end
end

