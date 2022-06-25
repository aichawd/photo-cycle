class AddTechnicalDetailsToPictures < ActiveRecord::Migration[6.1]
  def change
    add_column :pictures, :boitier, :string
    add_column :pictures, :objectif, :string
    add_column :pictures, :ouverture, :string
    add_column :pictures, :temps_pose, :string
    add_column :pictures, :sensibilite, :string
  end
end
