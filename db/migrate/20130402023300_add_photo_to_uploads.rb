class AddPhotoToUploads < ActiveRecord::Migration
  def change
    add_column :uploads, :photo_file_name, :string
    add_column :uploads, :photo_content_type, :string
    add_column :uploads, :photo_file_size, :integer
  end
end
