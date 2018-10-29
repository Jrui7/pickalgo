class Product < ApplicationRecord
  belongs_to :category
  belongs_to :pro
  has_attachments :photos, maximum: 5

  def self.my_products(current_pro)
    where(pro_id: current_pro)
  end
end
