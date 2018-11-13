class ProceedOpenPaymentJob < ApplicationJob
  queue_as :default

    def perform(pick_id, campaign_id)
      pick = Pick.find(pick_id)
      user = pick.user
      campaign = Campaign.find(campaign_id)
      price = (campaign.price_1 * 100).to_i
      delivery = (campaign.product.expedition_costs.to_i * 100).to_i
      total = price + delivery

      begin
        charge = Stripe::Charge.create(
          card:     pick.card["id"],
          customer:     user.customer_id,
          amount:       total,
          description:  "#{campaign.product.title} via Pickalgo",
          currency:     'eur',
          :destination => {
            :account => "#{campaign.product.pro.stripe_uid}",
          }
        )
        pick.update(state: "paid", transac_detail: charge.to_json)
        CampaignMailer.success(user.id, campaign.id, pick.id).deliver_later
      rescue
        pick.update(state: "error")
        CampaignMailer.payment_error(user.id, campaign.id, pick.id).deliver_later
      end

    end
  end
