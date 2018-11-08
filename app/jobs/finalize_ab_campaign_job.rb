class FinalizeAbCampaignJob < ApplicationJob
  queue_as :default

  def perform(campaign_id)
    @campaign = Campaign.find(campaign_id)

  end
end
