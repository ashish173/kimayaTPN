class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable, :confirmable
  validates_presence_of :name, :message => "Please enter user name"
  validates :email, :presence => true
  validates :roles_mask, :presence => true
  validates_format_of :residence_telephone,:with =>  /^(\d{3}-){2}\d{4}$/, :message => "Please enter valid phone number"
  validates_format_of :emergency_telephone, :mobile_number,:with =>  /^(\d{3}-){2}\d{4}$/, :message => "Please enter valid phone number", :allow_blank => true
  # Setup accessible (or protected) attributes for your model
  attr_accessible :password, :email, :name, :address, :city, :pincode, :residence_telephone, :emergency_telephone, :mobile_number, :additional_detail, :roles_mask


  def reset_email
    self.confirmed_at = nil
    self.save!
    self.send_confirmation_instructions
  end

  scope :with_role, lambda { |role| {:conditions => "roles_mask & #{2**Role.index(role.to_s)} > 0"} }

  def role=(role)
    self.roles_mask=role
  end


  def role?(role)
    self.roles_mask == role
  end
  before_validation(:on => :create) do
    self.password = ActiveSupport::SecureRandom.base64(6)
  end
end

