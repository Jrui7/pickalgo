class AddViewCounterToCampaign < ActiveRecord::Migration[5.2]
  def change
    add_column :campaigns, :views, :integer, default: 0
  end
end
