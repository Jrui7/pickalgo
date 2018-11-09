class Pick < ApplicationRecord
  belongs_to :campaign
  belongs_to :user
  self.per_page = 10

  def self.pending_picks(user)
    where(user_id: user, state: "pending", card: {}).select {|pick| pick.campaign.ongoing?}
  end

  def self.campaign_picked_by_user?(user, campaign)
    where(user_id: user, campaign_id: campaign, state: "pending").any?
  end

  def self.campaign_viewed_by_user?(user, campaign)
    where(user_id: user, campaign_id: campaign).any?
  end

end
