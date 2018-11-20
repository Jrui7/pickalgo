class FinalizeCampaignJob < ApplicationJob
  queue_as :default


  def perform(campaign_id)
    @campaign = Campaign.find(campaign_id)
    @validated_picks = @campaign.validated_picks
    @new_chances = @campaign.new_chances

    @validated_picks.each do |pick|
      ProceedAbPaymentJob.perform_later(pick.id, campaign_id)
    end

    @new_chances.each do |pick|
      CampaignMailer.new_chance(pick.user_id, @campaign.id, pick.id).deliver_later
    end
    @campaign.update(finalized: true)
  end
end
