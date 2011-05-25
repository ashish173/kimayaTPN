class CreatePatients < ActiveRecord::Migration
  def self.up
    create_table(:patients) do |t|
      t.string :gender_id
      t.string :name
      t.string :registration_number
      t.datetime :date_of_birth
      t.float :birth_weight
      t.string :address
      t.string :city
      t.string :pincode
      t.string :state
      t.string :residence_telephone
      t.string :emergency_telephone
      t.string :mobile_number
      t.string :additional_detail
      t.timestamps
    end
    add_index :patients, :registration_number
    add_index :patients, :gender_id
  end

  def self.down
    drop_table :patients
  end
end
