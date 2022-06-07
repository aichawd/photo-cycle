class DeletePersonalMessages < ActiveRecord::Migration[6.1]
  def change
    drop_table :personal_messages
  end
end
