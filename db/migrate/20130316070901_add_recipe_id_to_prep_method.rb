class AddRecipeIdToPrepMethod < ActiveRecord::Migration
  def change
    add_column :prep_methods, :recipe_id, :integer
  end
end
