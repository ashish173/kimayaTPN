class RemoveTpnDateFromTpn < ActiveRecord::Migration
  def up
    remove_column :tpns, :tpn_date
  end

  def down
  end
end
