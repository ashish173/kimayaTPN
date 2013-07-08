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
  
end
