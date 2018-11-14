class FinalizeOpenCampaignJob < ApplicationJob
  queue_as :default

  def perform(price, campaign_id)
    @campaign = Campaign.find(campaign_id)
    @validated_picks = @campaign.validated_picks_open(price)
    @rejected_picks = @campaign.rejected_picks_open(price)

    @validated_picks.each do |pick|
      ProceedOpenPaymentJob.perform_later(pick.id, campaign_id)
    end

    @rejected_picks.each do |pick|
      CampaignMailer.failed_open(pick.id, @campaign.id).deliver_later
    end

    @campaign.update(finalized: true)
  end
end
