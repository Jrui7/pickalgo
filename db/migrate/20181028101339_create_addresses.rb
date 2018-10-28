class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :street
      t.string :zip_code
      t.string :city
      t.belongs_to :resident, polymorphic: true

      t.timestamps
    end
    add_index :addresses, [:resident_id, :resident_type]
  end
end
