class Campaign < ApplicationRecord
  belongs_to :product
  after_create :set_expiration


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



end
