class ChangePriceInputsToFloatsInCampaigns < ActiveRecord::Migration[5.2]
  def change
    remove_column :campaigns, :price_1
    remove_column :campaigns, :price_2
    remove_column :campaigns, :price_3
  end
end
