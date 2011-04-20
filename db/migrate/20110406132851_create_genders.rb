class CreateGenders < ActiveRecord::Migration
  def self.up
    create_table(:genders) do |t|
      t.integer :gender_id, :unique =>true
      t.string :name, :unique => true
    end
  end

  def self.down
    drop_table :genders
  end
end
