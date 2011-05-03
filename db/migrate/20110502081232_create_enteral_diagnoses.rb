class CreateEnteralDiagnoses < ActiveRecord::Migration
  def self.up
    create_table :enteral_diagnoses do |t|
      t.references :investigation
      t.string :enteral_nutrition_type
      t.string :enteral_nutrition
      t.string :enteral_calories
      t.timestamps
    end
  end

  def self.down
    drop_table :enteral_diagnoses
  end
end
