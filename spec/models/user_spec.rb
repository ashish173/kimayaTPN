require 'spec_helper'

describe User do
  it "is invalid without a name" do
    user = User.new(
      address: "vassar street",
      email: "aitashish173@gmail.com",
      role_id: 2)
    expect(user).to have(1).errors_on(:name)
    #expect(user).to have(1).errors_on(:role_id)
  end

  it "is invalid without a role_id" do
    user = User.new(  
      name: "ashish singh",
      email: "aitashish173@gmail.com")  
    expect(user).to have(1).errors_on(:role_id)  
  end
=begin
  it "is invalid without a hospital_id" do
    user = User.new(
      name: "ashish singh",
      email: "aitashish173@gmail.com",
      )
    expect(user).to have(1).errors_on(:hospital_id)  
  end
=end  
  it "is invalid with already used email address" do
    # its not allowing to create a record 
    # as in the background on user create it tries to 
    # send an email and smtp connection is not being 
    # estabilished for some reason.
    user1 = User.create!(
      name: "ashish singh",
      email: "aitashish173@gmail.com",
      password: "fedora",
      role_id: 2)
    user = User.new(
      name: "c0mrade",
      email: "aitashish173@gmail.com")  
      expect(user).to have(1).errors_on(:email)  
  end
  
   


end
