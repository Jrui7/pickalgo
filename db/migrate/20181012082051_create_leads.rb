class CreateLeads < ActiveRecord::Migration[5.2]
  def change
    create_table :leads do |t|
      t.string :brand
      t.string :email
      t.string :phone
      t.string :contact_person
      t.string :referal

      t.timestamps
    end
  end
end
