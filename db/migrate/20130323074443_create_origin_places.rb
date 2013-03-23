class CreateOriginPlaces < ActiveRecord::Migration
  def change
    create_table :origin_places do |t|

      t.timestamps
    end
  end
end
