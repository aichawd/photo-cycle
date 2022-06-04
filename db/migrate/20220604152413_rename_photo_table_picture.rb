class RenamePhotoTablePicture < ActiveRecord::Migration[6.1]
  def change
    rename_table :photos, :pictures
  end
end
