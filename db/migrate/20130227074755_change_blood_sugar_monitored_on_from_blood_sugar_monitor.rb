class ChangeBloodSugarMonitoredOnFromBloodSugarMonitor < ActiveRecord::Migration
  def up
    change_column :blood_sugar_monitors, :blood_sugar_monitored_on, :datetime
  end

  def down
  end
end
