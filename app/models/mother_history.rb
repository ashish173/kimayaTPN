class MotherHistory < ActiveRecord::Base
  belongs_to :patient
  validates :patient, :is_anc, :g , :p , :a, :maternal_usg, :age, :pre_pregnancy_weight, :height, :toxemia, :diabetes, :is_antenatal_steroids, :medical_history, :presence => true

  serialize :post_obstetric_history, :other_medical_problems

  def post_obstetric_history=(post_obstetric_history_array)    
    write_attribute :post_obstetric_history, post_obstetric_history_array 
  end

  def post_obstetric_history
    read_attribute(:post_obstetric_history) || []
  end

  def other_medical_problems=(other_medical_problems_array)    
    write_attribute :other_medical_problems, other_medical_problems_array 
  end

  def other_medical_problems 
    read_attribute(:other_medical_problems) || []
  end

end
