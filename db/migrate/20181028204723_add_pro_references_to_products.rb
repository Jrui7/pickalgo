class AddProReferencesToProducts < ActiveRecord::Migration[5.2]
  def change
    add_reference :products, :pro, foreign_key: true
  end
end
