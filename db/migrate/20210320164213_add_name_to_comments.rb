class AddNameToComments < ActiveRecord::Migration[6.1]
  def change
    add_column :comments, :name, :string
  end
end
