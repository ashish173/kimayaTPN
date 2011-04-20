class CreateTpns < ActiveRecord::Migration
  def self.up
    create_table :tpns do |t|
      t.references :patient
      t.float :current_weight
      t.integer :day_of_tpn
      t.float :dextrose_conc
      t.datetime :tpn_date
      t.string :administration
      t.float :total_fluid_intake
      t.float :feed_volume
      t.float :fat_volume
      t.float :fat_concentration
      t.float :factor
      t.float :losses
      t.float :amino_acid
      t.float :sodium_chloride
      t.float :potassium_chloride
      t.float :calcium
      t.float :magnesium
      t.float :mvi
      t.integer :amino_acid_additive_id
      t.integer :sodium_chloride_additive_id
      t.integer :potassium_chloride_additive_id
      t.integer :calcium_additive_id
      t.integer :magnesium_additive_id
      t.float :heparin
      t.timestamps
    end
  end

  def self.down
    drop_table :tpns
  end
end
