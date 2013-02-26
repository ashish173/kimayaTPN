class AddSlugToHospitals < ActiveRecord::Migration
  def change
    add_column :hospitals, :slug, :string
  end
end
