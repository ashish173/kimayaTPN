class AddDefaultToIsAnc < ActiveRecord::Migration
  def change
     change_column :mother_histories, :is_anc, :boolean, :default => false
  end
end
