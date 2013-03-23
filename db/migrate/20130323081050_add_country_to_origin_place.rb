class AddCountryToOriginPlace < ActiveRecord::Migration
  def change
    add_column :origin_places, :country, :string
  end
end
