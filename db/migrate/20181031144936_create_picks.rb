class CreatePicks < ActiveRecord::Migration[5.2]
  def change
    create_table :picks do |t|
      t.float :price
      t.references :campaign, foreign_key: true
      t.references :user, foreign_key: true
      t.string :state
      t.string :answer

      t.timestamps
    end
  end
end
