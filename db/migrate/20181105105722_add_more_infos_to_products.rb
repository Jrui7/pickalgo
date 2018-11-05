class AddMoreInfosToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :price_ht, :float
    add_column :products, :expedition_costs, :float
    add_column :products, :video_url, :string
    add_column :products, :facebook, :string
    add_column :products, :instagram, :string
    add_column :products, :youtube, :string
    add_column :products, :twitter, :string
    add_column :products, :size_guide, :string
  end
end
