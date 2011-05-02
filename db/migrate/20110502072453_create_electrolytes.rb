class CreateElectrolytes < ActiveRecord::Migration
  def self.up
    create_table :electrolytes do |t|
      t.string :sodium
      t.string :potassium
      t.string :calcium
      t.string :urea
      t.string :triglycerides
      t.string :creatinin
      t.timestamps
    end
  end

  def self.down
    drop_table :electrolytes
  end
end
