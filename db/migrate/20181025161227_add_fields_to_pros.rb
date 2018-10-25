class AddFieldsToPros < ActiveRecord::Migration[5.2]
  def change
    add_column :pros, :brand, :string
    add_column :pros, :phone, :string
    add_column :pros, :contact_person, :string
    add_column :pros, :referal, :string
    add_column :pros, :slug, :string
    add_index :pros, :slug, unique: true
  end
end
