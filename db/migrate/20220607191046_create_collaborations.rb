class CreateCollaborations < ActiveRecord::Migration[6.1]
  def change
    create_table :collaborations do |t|
      t.string :name
      t.integer :status

      t.timestamps
    end
  end
end
