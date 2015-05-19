class AddCatIdToWorkshops < ActiveRecord::Migration
  def change
    add_column :workshops, :cat_id, :integer
  end
end
