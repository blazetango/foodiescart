class AddOriginIdToRecipes < ActiveRecord::Migration
  def change
    add_column :recipes, :origin_id, :integer
  end
end
