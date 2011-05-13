class CreateBloodSugarMonitors < ActiveRecord::Migration
  def self.up
    create_table :blood_sugar_monitors do |t|
      t.references :investigation
      t.time :blood_sugar_monitored_on
      t.string :details
      t.timestamps
    end
  end

  def self.down
    drop_table :blood_sugar_monitors
  end
end
