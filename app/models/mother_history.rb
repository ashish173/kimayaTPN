class MotherHistory < ActiveRecord::Base
  belongs_to :patient
  has_many :medical_histories, :dependent => :destroy
  accepts_nested_attributes_for :medical_histories

  serialize :post_obstetric_history

  def post_obstetric_history=(post_obstetric_history_array)    
    write_attribute :post_obstetric_history, post_obstetric_history_array 
  end

  def post_obstetric_history
    read_attribute(:post_obstetric_history) || []
  end

end
