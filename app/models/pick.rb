class Pick < ApplicationRecord
  belongs_to :campaign
  belongs_to :user
  self.per_page = 10
end
