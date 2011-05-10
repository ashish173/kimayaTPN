class AddGaToPatientHistory < ActiveRecord::Migration
  def self.up
    add_column :patient_histories, :ga, :string
  end

  def self.down
    remove_column :patient_histories, :ga
  end
end
