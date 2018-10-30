class AddTitleToCampaign < ActiveRecord::Migration[5.2]
  def change
    add_column :campaigns, :title, :string
  end
end
