class AddDeliveryInfosToPicks < ActiveRecord::Migration[5.2]
  def change
    add_column :picks, :delivery_infos, :json, default: {}
  end
end
