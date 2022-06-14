class CreateNewTables < ActiveRecord::Migration[6.1]
  def change
    create_table :chatrooms do |t|
      t.references :first_user
      t.references :second_user

      t.timestamps

    end

    add_foreign_key :chatrooms, :users, column: :first_user_id, primary_key: :id
    add_foreign_key :chatrooms, :users, column: :second_user_id, primary_key: :id

    create_table :messages do |t|
      t.text :content
      t.references :sender
      t.references :chatroom

      t.timestamps

    end
    add_foreign_key :messages, :users, column: :sender_id, primary_key: :id
    add_foreign_key :messages, :chatrooms, column: :chatroom_id, primary_key: :id

  end

end
