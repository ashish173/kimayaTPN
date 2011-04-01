namespace :user do
  desc "Create super admin"
  task :super_admin => :environment do
    user = User.create(:user_id => "1", :name => "su", :email => "xyz@joshsoftware.com", :roles_mask => Role.index("Super Admin"), :password => "admin123")
    p user.confirm!
    user.save
  end
end
