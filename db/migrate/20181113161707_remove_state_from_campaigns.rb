class RemoveStateFromCampaigns < ActiveRecord::Migration[5.2]
  def change
    remove_column :campaigns, :state, :string
    add_column :campaigns, :finalized, :boolean, default: false
  end
end
