class CreateBiochemistryAssessments < ActiveRecord::Migration
  def self.up
    create_table :biochemistry_assessments do |t|
      t.references :investigation
      t.string :serum_urea
      t.string :serum_creatinine
      t.string :triglycerides
      t.string :urine_area
      t.string :bilirubin
      t.timestamps
    end
  end

  def self.down
    drop_table :biochemistry_assessments
  end
end
