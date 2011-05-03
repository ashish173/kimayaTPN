class CreateDiagnoses < ActiveRecord::Migration
  def self.up
    create_table :diagnoses do |t|
      t.references :investigation
      t.boolean :hypoglycemia
      t.string  :hypoglycemia_episode
      t.boolean :hyperglycemia
      t.string  :hyperglycemia_episode
      t.boolean :spesis
      t.string  :sepsis_details
      t.boolean :exhange
      t.boolean :thrombocytopenia
      t.string  :dol
      t.boolean :haemorrhage
      t.string  :grade
      t.timestamps
    end
  end

  def self.down
    drop_table :diagnoses
  end
end
