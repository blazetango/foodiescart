class AddQuantityToIngredientRecipes < ActiveRecord::Migration
  def change
    add_column :ingredient_recipes, :quantity, :string
  end
end
