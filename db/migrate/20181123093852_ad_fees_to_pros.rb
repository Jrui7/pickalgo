class AdFeesToPros < ActiveRecord::Migration[5.2]
  def change
    add_column :pros, :fixed_fees, :float, default: 0.25
    add_column :pros, :variable_fees, :float, default: 0.016
  end
end
