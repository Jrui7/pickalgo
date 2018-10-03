class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :terms_of_service, acceptance: { message: "Merci de valider les conditions d'utilisation" }
  validates :first_name, presence: { message: "Merci de renseigner votre prénom" }
  validates :last_name, presence: { message: "Merci de renseigner votre prénom" }
end
