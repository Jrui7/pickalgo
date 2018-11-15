class FinalizeCampaignJob < ApplicationJob
  queue_as :default


  def perform(campaign_id)
    @campaign = Campaign.find(campaign_id)
    @validated_picks = @campaign.validated_picks
    @desavantage_picks = @campaign.desavantage_picks

    @validated_picks.each do |pick|
      ProceedAbPaymentJob.perform_later(pick.id, campaign_id)
    end

    @desavantage_picks.each do |pick|
      CampaignMailer.desavantage_pick(pick.user.id, @campaign.id, pick.id).deliver_later
    end
    @campaign.update(finalized: true)
  end
end
