class AddChangesToRecipes < ActiveRecord::Migration
  def change
    add_column :recipes, :course, :string
    add_column :recipes, :servers, :integer
    add_column :recipes, :tips, :string
    add_column :recipes, :prep_time, :time
    add_column :recipes, :origin, :string
  end
end
