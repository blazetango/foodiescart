class AddRecipeIdToOrigin < ActiveRecord::Migration
  def change
    add_column :origins, :recipe_id, :integer
  end
end
