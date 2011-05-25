class AddMedicalHistoryForMother < ActiveRecord::Migration
  def self.up
    add_column :mother_histories, :medical_history, :string
    add_column :mother_histories, :other_medical_problems, :text
  end

  def self.down
    drop_column :mother_histories, :medical_history
    drop_column :mother_histories, :other_medical_problems
  end
end
