class CreateOrigins < ActiveRecord::Migration
  def change
    create_table :origins do |t|
      t.string :country

      t.timestamps
    end
  end
end
