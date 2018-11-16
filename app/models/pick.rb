class Pick < ApplicationRecord
  belongs_to :campaign
  belongs_to :user
  has_one :order
  self.per_page = 10

  def self.pending_picks(user)
    where(user_id: user, state: "pending").select {|pick| pick.delivery_infos == {} && pick.campaign.ongoing?}
  end


end
