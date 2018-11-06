class AddStripeUidToPros < ActiveRecord::Migration[5.2]
  def change
    add_column :pros, :stripe_uid, :string
  end
end
