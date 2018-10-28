class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :title
      t.text :description
      t.references :category, foreign_key: true
      t.float :price
      t.string :slug
      t.string :website

      t.timestamps
    end
  end
end
