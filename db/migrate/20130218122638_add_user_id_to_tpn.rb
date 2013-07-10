class AddUserIdToTpn < ActiveRecord::Migration
  def change
    add_column :tpns, :user_id, :integer
  end
end
