class AddCategoriesToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :recipes, :course, :string
    add_column :recipes, :cuisine, :string
    add_column :recipes, :prep_time, :integer
    add_column :recipes, :cook_time, :integer
    add_column :recipes, :serves, :integer
    remove_column :recipes, :notes, :string
  end
end
