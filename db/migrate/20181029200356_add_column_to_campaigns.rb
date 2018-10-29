class AddColumnToCampaigns < ActiveRecord::Migration[5.2]
  def change
    add_reference :campaigns, :product, foreign_key: true
  end
end
