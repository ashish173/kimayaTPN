class CreateAnthropometricMeasurements < ActiveRecord::Migration
  def self.up
    create_table :anthropometric_measurements do |t|
      t.references :investigation
      t.float :weight
      t.float :head_circ
      t.float :length
      
      t.date  :weight_measured_date
      t.date  :head_circ_measured_date
      t.date  :length_measured_date
      t.timestamps
    end
  end

  def self.down
    drop_table :anthropometric_measurements
  end
end
