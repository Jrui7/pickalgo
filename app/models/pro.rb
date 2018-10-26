class Pro < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :validatable
  validates :email, presence: { message: "Merci de renseigner l'email du contact" }
  validates :email, uniqueness: true
  validates :brand, presence: { message: "Merci de renseigner le nom de votre entreprise, marque, service..." }
  validates :contact_person, presence: { message: "Merci de renseigner le nom de la personne à contacter" }

 extend FriendlyId
  friendly_id :brand, use: :slugged
end
