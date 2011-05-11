class CreateEnteralDiagnoses < ActiveRecord::Migration
  def self.up
    create_table :enteral_diagnoses do |t|
      t.references :investigation
      t.boolean :ebm
      t.boolean :formula_feeds
      t.string :enteral_nutrition
      t.string :total_enteral_calories
      t.timestamps
    end
  end

  def self.down
    drop_table :enteral_diagnoses
  end
end
