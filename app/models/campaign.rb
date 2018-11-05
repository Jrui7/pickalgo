class Campaign < ApplicationRecord
  self.per_page = 10
  belongs_to :product
  belongs_to :category
  has_many :picks
  after_create :set_expiration

  extend FriendlyId
    friendly_id :slug_candidates, use: :slugged
    def slug_candidates
      [
        :title,
        [:title, :insert_id],
      ]
    end

    def insert_id
      nb = Campaign.count
      nb > 0 ?  sequence = Campaign.last.id + 1 : sequence = 1
      "#{sequence}"
    end


  scope :ongoing, -> { where('expiration_date > ?', DateTime.now)}


  def set_expiration
    self.expiration_date = DateTime.now + 7.days
    self.save
  end

  def state
    if self.expiration_date > DateTime.now
      "ongoing"
    else
      "closed"
    end
  end


  def increment_views
    self.views += 1
    save!
  end

  def ongoing?
    self.expiration_date > DateTime.now
  end





end
