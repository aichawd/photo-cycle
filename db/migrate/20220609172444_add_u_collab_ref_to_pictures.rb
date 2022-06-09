class AddUCollabRefToPictures < ActiveRecord::Migration[6.1]
  def change
    add_reference :pictures, :collaboration, foreign_key: true
  end
end
