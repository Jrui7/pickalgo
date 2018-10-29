class AddExpirationColumnToCampaigns < ActiveRecord::Migration[5.2]
  def change
    add_column :campaigns, :expiration_date, :datetime
  end
end
