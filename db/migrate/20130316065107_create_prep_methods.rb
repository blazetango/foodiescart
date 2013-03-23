class CreatePrepMethods < ActiveRecord::Migration
  def change
    create_table :prep_methods do |t|
      t.string :steps

      t.timestamps
    end
  end
end
