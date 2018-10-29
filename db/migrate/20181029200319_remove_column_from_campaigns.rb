class RemoveColumnFromCampaigns < ActiveRecord::Migration[5.2]
  def change
    remove_column :campaigns, :product_referenecs, :string
  end
end
