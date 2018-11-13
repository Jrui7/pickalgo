class FinalizeCampaignJob < ApplicationJob
  queue_as :default


  def perform(campaign_id)
    @campaign = Campaign.find(campaign_id)
    @validated_picks = @campaign.validated_picks

    @validated_picks.each do |pick|
      ProceedAbPaymentJob.perform_later(pick.id, campaign_id)
    end
    @campaign.update(state: "finalized")
  end
end
