class ChangeDefaultToPictureCollab < ActiveRecord::Migration[6.1]
  def change
    change_column_default :pictures, :collaboration_id, nil
  end
end
