class CreateMotherHistories < ActiveRecord::Migration
  def self.up
    create_table :mother_histories do |t|
      t.references :patient
      t.boolean :is_anc
      t.float :g
      t.float :p
      t.float :a
      t.string :maternal_usg
      t.string :age
      t.string :pre_pregnancy_weight
      t.string :height
      t.string :toxemia
      t.string :diabetes
      t.string :is_antenatal_steroids

      t.timestamps
    end
  end

  def self.down
    drop_table :mother_histories
  end


end
