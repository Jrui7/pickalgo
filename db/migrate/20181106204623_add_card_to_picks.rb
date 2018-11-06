class AddCardToPicks < ActiveRecord::Migration[5.2]
  def change
    add_column :picks, :card, :jsonb, default: {}
  end
end
