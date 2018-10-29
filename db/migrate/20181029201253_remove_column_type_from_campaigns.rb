class RemoveColumnTypeFromCampaigns < ActiveRecord::Migration[5.2]
  def change
    remove_column :campaigns, :type, :string
  end
end
