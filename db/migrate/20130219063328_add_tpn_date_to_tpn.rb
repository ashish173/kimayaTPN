class AddTpnDateToTpn < ActiveRecord::Migration
  def change
    add_column :tpns, :tpn_date, :date
  end
end
