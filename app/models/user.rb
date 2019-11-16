class User < ApplicationRecord
  validate :validate_invite, :on => :create
  has_many :picks
  has_many :campaigns, through: :picks
  has_one :address
  attr_accessor :invite

  extend FriendlyId
  friendly_id :slug_candidates, use: :slugged
  def slug_candidates
    [
      :first_name,
      [:first_name, :last_name],
      [:first_name, :last_name, :insert_id],
    ]
  end

  def insert_id
    nb = User.count
    nb > 0 ?  sequence = User.last.id + 1 : sequence = 1
    "#{sequence}"
  end



  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :terms_of_service, acceptance: { message: "Merci de valider les conditions d'utilisation" }
  validates :first_name, presence: { message: "Merci de renseigner votre prénom" }
  validates :last_name, presence: { message: "Merci de renseigner votre nom" }
  validates :email, presence: { message: "Merci de renseigner votre email" }
  validates :email, uniqueness: true

  after_create :send_welcome_email
  after_create :subscribe_to_newsletter


  private

  def send_welcome_email
    # UserMailer.welcome(self.id).deliver_later
    UserMailer.welcome(self.id).deliver_later(wait_until: 1.day.from_now)
  end

  def subscribe_to_newsletter
    AddUserToMarketingListJob.perform_later(self.id)
  end

  def validate_invite
    if self.invite != "XDMp2020"
      self.errors[:base] << "Code is invalide"
    end
  end




end
