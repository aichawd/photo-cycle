class AddStoryToCollab < ActiveRecord::Migration[6.1]
  def change
    add_column :collaborations, :story, :string
  end
end
