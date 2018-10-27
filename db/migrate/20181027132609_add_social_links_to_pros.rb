class AddSocialLinksToPros < ActiveRecord::Migration[5.2]
  def change
    add_column :pros, :insta, :string
    add_column :pros, :youtube, :string
    add_column :pros, :facebook, :string
    add_column :pros, :twitter, :string
  end
end
