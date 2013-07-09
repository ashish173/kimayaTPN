require 'spec_helper'

describe User do

  it "is invalid without a name" do
    expect(build(:user, name: nil)).to have(1).errors_on(:name)
  end

  it "is invalid without a role_id" do
    expect(build(:user, role_id: nil)).to have(1).errors_on(:role_id)  
  end

  it "is invalid with already used email address" do
    create(:user, email: "ashish@gmail.com")
    expect(build(:user, email: "ashish@gmail.com")).to have(1).errors_on(:email)
  end
 
  it "is invalid if email address not present" do
    expect(build(:user, email: nil)).to have(1).errors_on(:email)
  end
   
  it "is invalid if the password is not given" do
    
    expect(build(:user, password: nil)).to have(1).errors_on(:password)
  end

  it "is invalid if role_id not given " do
    expect(build(:user, role_id: nil)).to have(1).errors_on(:role_id)
  end
  
end

