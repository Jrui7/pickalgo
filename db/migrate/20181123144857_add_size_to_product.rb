class AddSizeToProduct < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :size, :boolean
  end
end
