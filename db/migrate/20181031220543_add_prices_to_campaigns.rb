class AddPricesToCampaigns < ActiveRecord::Migration[5.2]
  def change
    add_column :campaigns, :price_1, :float
    add_column :campaigns, :price_2, :float
    add_column :campaigns, :price_3, :float
  end
end
