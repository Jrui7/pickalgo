class CreateCampaigns < ActiveRecord::Migration[5.2]
  def change
    create_table :campaigns do |t|
      t.datetime :launch_date
      t.string :type
      t.string :price_1
      t.string :price_2
      t.string :price_3
      t.string :product_referenecs

      t.timestamps
    end
  end
end
