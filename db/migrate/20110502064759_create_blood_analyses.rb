class CreateBloodAnalyses < ActiveRecord::Migration
  def self.up
    create_table :blood_analyses do |t|
      t.references :investigation
      t.string :ph
      t.string :pco2
      t.string :pao2
      t.string :hco3
      t.string :abe
      t.string :so2
      t.timestamps
    end
  end

  def self.down
    drop_table :blood_analyses
  end
end
