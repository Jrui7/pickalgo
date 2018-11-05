class RemoveUselessColumnsFromPros < ActiveRecord::Migration[5.2]
  def change
    remove_column :pros, :twitter
    remove_column :pros, :facebook
    remove_column :pros, :insta
    remove_column :pros, :youtube
    remove_column :pros, :bio
  end
end
