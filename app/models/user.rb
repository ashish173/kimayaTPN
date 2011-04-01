class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable, :confirmable
  validates :name, :presence => true
  validates :email, :presence => true
  validates :user_id, :presence => true
  validates :roles_mask, :presence => true
  # Setup accessible (or protected) attributes for your model
  attr_accessible :password, :email, :user_id, :name, :address, :city, :pincode, :residence_telephone, :emergency_telephone, :mobile_number, :additional_detail, :roles_mask


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

