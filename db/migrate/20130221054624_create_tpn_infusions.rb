class CreateTpnInfusions < ActiveRecord::Migration
  def change
    create_table :tpn_infusions do |t|
      t.float :feed_volume_over_24_hour
      t.float :arterial_line_infusion
      t.float :inotrope_infusion
      t.float :other_infusion
      t.integer :tpn_id
      t.timestamps
    end
  end
end
