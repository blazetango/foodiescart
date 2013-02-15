class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :user_id
      t.text :comment_data
      t.integer :recipe_id

      t.timestamps
    end
  end
end
