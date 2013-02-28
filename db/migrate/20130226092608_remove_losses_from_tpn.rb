class RemoveLossesFromTpn < ActiveRecord::Migration
  def up
  remove_column :tpns, :losses 
  end

  def down
  end
end
