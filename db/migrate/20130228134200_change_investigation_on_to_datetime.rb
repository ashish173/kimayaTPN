class ChangeInvestigationOnToDatetime < ActiveRecord::Migration
  def up
    change_column :investigations, :investigated_on, :datetime
  end

  def down
  end
end
