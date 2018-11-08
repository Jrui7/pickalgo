class Campaign < ApplicationRecord
  self.per_page = 10
  belongs_to :product
  belongs_to :category
  has_many :picks
  after_create :set_expiration
  validates :test_type, presence: { message: "Merci de choisir un type de test pour votre campagne" }

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
  scope :ab, -> { where(test_type: "A/B Test")}
  scope :open, -> { where.not(test_type: "A/B Test")}
  after_create :finalize_ab_campaign

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


  def ab_campaign?
    self.test_type == "A/B Test"
  end

  def open_type?
    ! ab_campaign?
  end

  def uniq_views
    self.picks.count
  end

  def added_to_cart
    self.picks.where.not(answer: [nil, ""]).order('price DESC')
  end

  def validated_picks
    added_to_cart.select { |pick| pick.card.present? }
  end

  def ab_final_price
    price = [self.price_1, self.price_2, self.price_3].reject {|v| v.nil? }.min
  end

  private

  def finalize_ab_campaign
    if self.ab_campaign?
      FinalizeCampaignJob.set(wait: 5.minutes).perform_later(self.id)
    end
  end


end
