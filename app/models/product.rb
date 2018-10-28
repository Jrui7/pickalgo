class Product < ApplicationRecord
  belongs_to :category
  belongs_to :pro
  has_attachments :photos, maximum: 5
end
