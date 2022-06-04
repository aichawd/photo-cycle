class ChangeForeignKeyForPictures < ActiveRecord::Migration[6.1]
  def change
    rename_column :photo_categories, :photo_id, :picture_id
  end
end
