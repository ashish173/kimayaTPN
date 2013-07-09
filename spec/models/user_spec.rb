require 'spec_helper'

describe User do
  let(:user) { User.new(name: "test user", email: "testuser@gmail.com", password: "testpass", role_id: 1) }

  it "is invalid without a name" do
    user.name = nil
    expect(user).to have(1).errors_on(:name)
  end

  it "is invalid without a role_id" do
    user.role_id = nil
    expect(user).to have(1).errors_on(:role_id)  
  end

  it "is invalid with already used email address" do
    user.save  # persist the object
    user1 = User.new(name: "c0mrade", email: "testuser@gmail.com")  
    expect(user1).to have(1).errors_on(:email)
  end
 
  it "is invalid if email address not present" do
    user.email = nil
    expect(user).to have(1).errors_on(:email)
  end
   
  it "is invalid if the password is not given" do
    user.password = nil
    expect(user).to have(1).errors_on(:password)
  end

  it "is invalid if role_id not given " do
    user.role_id = nil
    expect(user).to have(1).errors_on(:role_id)
  end

end
