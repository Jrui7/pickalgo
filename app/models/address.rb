class Address < ApplicationRecord
  belongs_to :user
  validates :first_name,
      presence: {
      message: "Renseigner prénom"
  }
  validates :last_name,
      presence: {
      message: "Renseigner nom"
  }

   validates :street,
      presence: {
      message: "Renseigner numéro et rue"
  }

   validates :zip_code,
      presence: {
      message: "Renseigner code postal"
  }
     validates :city,
      presence: {
      message: "Renseigner ville"
  }
end
