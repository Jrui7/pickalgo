class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :first_name
      t.string :last_name
      t.string :street
      t.string :zip_code
      t.string :city
      t.references :user, foreign_key: true
      t.string :address_complement
      t.string :phone_number

      t.timestamps
    end
  end
end
