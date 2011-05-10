class CreatePatientHistories < ActiveRecord::Migration
  def self.up
    create_table :patient_histories do |t|
      t.references :patient
      t.string :gestational_age
      t.string :gender_details
      t.string :ga
      t.string :mode_of_delivery
      t.string :rupture_of_membranes
      t.string :apgar_score_1
      t.string :apgar_score_5
      t.string :apgar_score_20

      t.timestamps
    end
  end

  def self.down
    drop_table :patient_histories
  end
end
