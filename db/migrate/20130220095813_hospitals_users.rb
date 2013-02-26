class HospitalsUsers < ActiveRecord::Migration
  def change
    create_table :hospitals_users, :id => false do |t|
      t.integer :hospital_id
      t.integer :user_id
    end
  end
end
