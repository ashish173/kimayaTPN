class DeviseCreateUsers < ActiveRecord::Migration
  def self.up
    create_table(:users) do |t|
      t.database_authenticatable :null => false
      t.string :name
      t.string :address
      t.string :city
      t.string :pincode
      t.string :residence_telephone
      t.string :emergency_telephone
      t.string :mobile_number
      t.string :additional_detail



      t.recoverable
      t.rememberable
      t.trackable

      t.confirmable
      # t.lockable :lock_strategy => :failed_attempts, :unlock_strategy => :both
      # t.token_authenticatable


      t.timestamps
    end

    add_index :users, :email,                :unique => true
    add_index :users, :reset_password_token, :unique => true
    # add_index :users, :confirmation_token,   :unique => true
    # add_index :users, :unlock_token,         :unique => true
  end

  def self.down
    drop_table :users
  end
end
