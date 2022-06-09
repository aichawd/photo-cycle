class AddUserstoCollabs < ActiveRecord::Migration[6.1]
  def change
    add_column :collaborations, :artist1_id, :integer
    add_column :collaborations, :artist2_id, :integer
  end
end
