class AddColumnTestTypeToCampaigns < ActiveRecord::Migration[5.2]
  def change
    add_column :campaigns, :test_type, :string
  end
end
