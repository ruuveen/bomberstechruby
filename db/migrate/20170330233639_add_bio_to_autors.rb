class AddBioToAutors < ActiveRecord::Migration[5.1]
  def change
    add_column :autors, :bio, :text
  end
end
