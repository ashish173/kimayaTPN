class Report < ActiveRecord::Base
  
  self.per_page = 10
  def self.columns() @columns ||= []; end
  def self.column(name, sql_type = nil, default = nil, null = true)
    columns << ActiveRecord::ConnectionAdapters::Column.new(name.to_s, default, sql_type.to_s, null)
  end
  column :start_date, :date
  column :end_date, :date
  column :patient, :integer
  validates :start_date, :end_date, :patient, :presence => true, :if => :is_investigation_type? 
  attr_accessor :report_for, :start_date, :end_date, :patient, :investigation
  def is_investigation_type?
    self.investigation == 'summary'
  end
end
