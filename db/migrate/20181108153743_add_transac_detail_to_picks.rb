class AddTransacDetailToPicks < ActiveRecord::Migration[5.2]
  def change
    add_column :picks, :transac_detail, :jsonb, default: {}
  end
end
