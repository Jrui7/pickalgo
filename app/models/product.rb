class Product < ApplicationRecord
  belongs_to :category
  belongs_to :pro
  has_attachments :photos, maximum: 5

  validates :title,
      presence: {
      message: "Nom du produit requis"
  }

  validates :price,
      presence: {
      message: "A quel prix votre produit est vendeu hors promo ?"
  }

  validates :title, length: { minimum: 5 }

  validates :description,
      presence: {
      message: "Descrivez votre produit ou service"
      }

    validates :description,  length: { minimum: 5,
      too_short: "%{count} carractères au minimum" }

  validates :category_id, presence: {
      message: "Attribuez une catégorie au produit"
      }

    validates :photos, presence: {
      message: "Ajoutez au moins une photo"
      }

  def self.my_products(current_pro)
    where(pro_id: current_pro)
  end
end
