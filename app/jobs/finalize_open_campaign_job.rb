class FinalizeOpenCampaignJob < ApplicationJob
  queue_as :default

  def perform(price, campaign_id)
    @campaign = Campaign.find(campaign_id)
    @validated_picks = @campaign.validated_picks_open(price)

    @validated_picks.each do |pick|
      ProceedOpenPaymentJob.perform_later(pick.id, campaign_id)
    end
    @campaign.update(finalized: true)
  end
end
