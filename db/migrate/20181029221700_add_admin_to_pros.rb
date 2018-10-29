class AddAdminToPros < ActiveRecord::Migration[5.2]
  def change
    add_column :pros, :admin, :boolean, default: false
  end
end
