class Lead < ApplicationRecord
  validates :email, presence: { message: "Merci de renseigner l'email du contact" }
  validates :email, uniqueness: true
  validates :brand, presence: { message: "Merci de renseigner le nom de votre entreprise, marque, service..." }
  validates :contact_person, presence: { message: "Merci de renseigner le nom de la personne à contacter" }

end
