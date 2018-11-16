class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.references :pick, foreign_key: true
      t.references :campaign, foreign_key: true
      t.references :pro, foreign_key: true
      t.boolean :completed, default: false

      t.timestamps
    end
  end
end
