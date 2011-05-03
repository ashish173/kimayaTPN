class CreateTpnAdditives < ActiveRecord::Migration
  def self.up
    create_table :tpn_additives do |t|
      t.references :investigation
      t.integer :day_of_life
      t.integer :day_of_tpn
      t.float   :fluid_intake
      t.float   :enteral_feeds
      t.float   :tpn_volume
      t.float   :amino_acids
      t.float   :lipids
      t.float   :tpn_calories
      t.float   :dir
      t.float   :ner
      t.timestamps
    end
  end

  def self.down
    drop_table :tpn_additives
  end
end
