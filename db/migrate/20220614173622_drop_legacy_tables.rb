class DropLegacyTables < ActiveRecord::Migration[6.1]
  def change
    drop_table :messages
    drop_table :participants
    drop_table :chatrooms
  end
end
