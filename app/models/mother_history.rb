class MotherHistory < ActiveRecord::Base
  belongs_to :patient
  has_many :medical_histories, :dependent => :destroy
  accepts_nested_attributes_for :medical_histories
  validates :patient, :is_anc, :g , :p , :a, :maternal_usg, :age, :pre_pregnancy_weight, :height, :toxemia, :diabetes, :is_antenatal_steroids, :presence => true

  serialize :post_obstetric_history

  def post_obstetric_history=(post_obstetric_history_array)    
    write_attribute :post_obstetric_history, post_obstetric_history_array 
  end

  def post_obstetric_history
    read_attribute(:post_obstetric_history) || []
  end

end
