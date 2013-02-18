class AddingHospitalIdToAllModel < ActiveRecord::Migration
  def up
    add_column :investigations, :hospital_id, :integer
    add_column :tpns, :hospital_id, :integer
    add_column :admissions, :hospital_id, :integer
    add_column :mother_histories, :hospital_id, :integer
    add_column :patient_histories, :hospital_id, :integer
    add_column :tpn_additives, :hospital_id, :integer
    add_column :diagnoses, :hospital_id, :integer
    add_column :reports, :hospital_id, :integer
  end

  def down
  end
end
