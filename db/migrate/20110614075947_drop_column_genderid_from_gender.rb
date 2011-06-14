class DropColumnGenderidFromGender < ActiveRecord::Migration
  def self.up
    remove_column :genders, :gender_id
  end

  def self.down
  end
end
