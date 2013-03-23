class AddOriginPlaceIdToRecipes < ActiveRecord::Migration
  def change
    add_column :recipes, :origin_place_id, :integer
  end
end
