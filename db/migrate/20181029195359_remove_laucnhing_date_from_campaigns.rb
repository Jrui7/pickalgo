class RemoveLaucnhingDateFromCampaigns < ActiveRecord::Migration[5.2]
  def change
    remove_column :campaigns, :launch_date, :string
  end
end
