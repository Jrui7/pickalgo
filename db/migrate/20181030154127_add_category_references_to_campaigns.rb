class AddCategoryReferencesToCampaigns < ActiveRecord::Migration[5.2]
  def change
    add_reference :campaigns, :category, foreign_key: true
  end
end
