class AddAutorIdToPosts < ActiveRecord::Migration[4.2]
  def change
    add_column :posts, :autor_id, :integer
    add_index  :posts, :autor_id
  end
end
