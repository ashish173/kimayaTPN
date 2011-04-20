class CreateTpnMarketAdditives < ActiveRecord::Migration
  def self.up
    create_table :tpn_market_additives do |t|
      t.string :name
      t.string :market_name
      t.float :constant
      t.string :unit
      t.float :max_value
      t.float :min_value
      t.timestamps
    end
  end

  def self.down
    drop_table :tpn_market_additives
  end
end
