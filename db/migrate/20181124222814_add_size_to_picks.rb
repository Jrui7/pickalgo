class AddSizeToPicks < ActiveRecord::Migration[5.2]
  def change
    add_column :picks, :size, :string
  end
end
