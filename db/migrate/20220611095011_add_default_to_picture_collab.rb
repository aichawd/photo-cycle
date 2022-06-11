class AddDefaultToPictureCollab < ActiveRecord::Migration[6.1]
  def change
    change_column_default :pictures, :collaboration_id, 0
  end
end
