# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

# create admin user

user = User.create!(:name => "admin", :email => "kimaya@joshsoftware.com", :roles_mask => Role.index("Super Admin"), :password => "admin123", :residence_telephone => "020-234342444")
user.confirm!
user.save


Gender.destroy_all
Gender.create(:gender_id => 1, :name => 'Unknown')
Gender.create(:gender_id => 2, :name => 'Single Male')
Gender.create(:gender_id => 3, :name => 'Single Female')
Gender.create(:gender_id => 4, :name => 'Male Twins')
Gender.create(:gender_id => 5, :name => 'Female Twins')
Gender.create(:gender_id => 6, :name => 'Male Triplets')
Gender.create(:gender_id => 7, :name => 'Female Triplets')



TpnMarketAdditive.destroy_all
TpnMarketAdditive.create(:name =>'Amino Acid', :market_name => 'Primene', :constant => 5, :unit => '%', :max_value => AMINO_ACID[MAX], :min_value => AMINO_ACID[MIN])
TpnMarketAdditive.create(:name => 'Amino Acid', :market_name => 'Aminoven Infant', :constant => 10, :unit => '%', :max_value => AMINO_ACID[MAX], :min_value => AMINO_ACID[MIN])
TpnMarketAdditive.create(:name => 'Sodium Chloride', :market_name => 'Normal Saline (NS)', :constant => 0.154, :unit => 'meq/ml', :max_value => SODIUM_CHLORIDE[MAX], :min_value => SODIUM_CHLORIDE[MIN])
TpnMarketAdditive.create(:name => 'Sodium Chloride', :market_name => '0.45 Normal Saline', :constant => 0.077, :unit => 'meq/ml', :max_value => SODIUM_CHLORIDE[MAX], :min_value => SODIUM_CHLORIDE[MIN])
TpnMarketAdditive.create(:name => 'Sodium Chloride', :market_name => 'Ringer Lactate', :constant => 0.13, :unit => 'meq/ml', :max_value => SODIUM_CHLORIDE[MAX], :min_value => SODIUM_CHLORIDE[MIN])
TpnMarketAdditive.create(:name => 'Sodium Chloride', :market_name => 'Ringer Lactate', :constant => 3, :unit => 'meq/ml', :max_value => SODIUM_CHLORIDE[MAX], :min_value => SODIUM_CHLORIDE[MIN])
TpnMarketAdditive.create(:name => 'Sodium Chloride', :market_name => 'Concentrated Ringer Lactate', :constant => 3.3, :unit => 'meq/ml', :max_value => SODIUM_CHLORIDE[MAX], :min_value => SODIUM_CHLORIDE[MIN])
TpnMarketAdditive.create(:name => 'Sodium Chloride', :market_name => '0.2 Normal Saline', :constant => 0.034, :unit => 'meq/ml', :max_value => SODIUM_CHLORIDE[MAX], :min_value => SODIUM_CHLORIDE[MIN])
TpnMarketAdditive.create(:name => 'Potassium Chloride', :market_name => 'Kesol', :constant => 2, :unit => 'meq/ml', :max_value => POTASSIUM_CHLORIDE[MAX], :min_value => POTASSIUM_CHLORIDE[MIN])
TpnMarketAdditive.create(:name => 'Calcium', :market_name => '10% Calcium Gluconate', :constant => 0.45, :unit => 'meq/ml', :max_value => CALCIUM[MAX], :min_value => CALCIUM[MIN])
TpnMarketAdditive.create(:name => 'Magnesium', :market_name => '50% Magnesium Sulfate', :constant => 4, :unit => 'meq/ml', :max_value => MAGNESIUM[MAX], :min_value => MAGNESIUM[MIN])
