class Campaign < ApplicationRecord
  belongs_to :product
  after_create :set_expiration


  def set_expiration
    self.expiration_date = DateTime.now + 7.days
    self.save
  end


end
