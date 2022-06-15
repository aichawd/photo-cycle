class AddDescriptionToCollabs < ActiveRecord::Migration[6.1]
  def change
    add_column :collaborations, :description, :text
  end
end
