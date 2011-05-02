class CreateInvestigations < ActiveRecord::Migration
  def self.up
    create_table :investigations do |t|
      t.references :patient
      t.date :investigated_on
      t.date :blood_sugar_monitor_on
      t.string :blood_sugar_monitor_details
      t.timestamps
    end
  end

  def self.down
    drop_table :investigations
  end
end
