class AddDefaultToCollabStatus < ActiveRecord::Migration[6.1]
  def change
    change_column_default :collaborations, :status, 0
  end
end
