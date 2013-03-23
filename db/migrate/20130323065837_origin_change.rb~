class OriginChange < ActiveRecord::Migration
  def up
     rename_column :recipes, :origin, :orig
     rename_column :recipes, :origin_id, :orig_id
  end

  def down
  end
end
