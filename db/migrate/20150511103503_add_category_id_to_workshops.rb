class AddCategoryIdToWorkshops < ActiveRecord::Migration
  def change
    add_column :workshops, :category_id, :integer
  end
end
