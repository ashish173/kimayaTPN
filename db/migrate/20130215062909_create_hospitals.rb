class CreateHospitals < ActiveRecord::Migration
  def change
    create_table :hospitals do |t|
      t.string :name
      t.integer :doctors_count
      t.integer :nutritionists_count
      t.integer :patients_count
      t.timestamps
    end
  end
end
