class AddPhotoToPrepMethods < ActiveRecord::Migration
  def change
    add_column :prep_methods, :photo_file_name, :string
    add_column :prep_methods, :photo_content_type, :string
    add_column :prep_methods, :photo_file_size, :integer
  end
end
