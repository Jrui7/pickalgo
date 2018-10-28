class AddBioToPros < ActiveRecord::Migration[5.2]
  def change
    add_column :pros, :bio, :text
  end
end
