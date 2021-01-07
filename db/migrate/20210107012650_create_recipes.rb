class CreateRecipes < ActiveRecord::Migration[6.1]
  def change
    create_table :recipes do |t|
      t.integer :user_id
      t.string :ingredients
      t.string :method
      t.string :notes
      t.string :image_url

      t.timestamps
    end
  end
end
