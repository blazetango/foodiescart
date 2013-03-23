class RemoveTestedFromRecipes < ActiveRecord::Migration
  def up
    remove_column :recipes, :tested
  end

  def down
    add_column :recipes, :tested, :tinyint
  end
end
