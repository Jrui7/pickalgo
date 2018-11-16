class Order < ApplicationRecord
  belongs_to :pick
  belongs_to :campaign
  belongs_to :pro
end
