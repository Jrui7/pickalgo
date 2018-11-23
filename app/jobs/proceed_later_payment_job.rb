class ProceedLaterPaymentJob < ApplicationJob
  queue_as :default

  def perform(pick_id, campaign_id)
    pick = Pick.find(pick_id)
    user = pick.user
    campaign = Campaign.find(campaign_id)
    delivery = campaign.product.expedition_costs.present? ? (campaign.product.expedition_costs * 100).to_i : 0

    if campaign.ab_campaign?
      price = (campaign.ab_final_price * 100).to_i
      total = price + delivery
    else
      price = (campaign.price_1 * 100).to_i
      total = price + delivery
    end
    fixed_fees = (campaign.product.pro.fixed_fees * 100)
    variable_fees = campaign.product.pro.variable_fees * price
    fees = (fixed_fees + variable_fees).to_i


    begin
      charge = Stripe::Charge.create(
        card:     pick.card["id"],
        customer:     user.customer_id,
        amount:       total,
        description:  "#{campaign.product.title} via Pickalgo",
        currency:     'eur',
        :destination => {
          :account => "#{campaign.product.pro.stripe_uid}",
        },
        application_fee: fees
      )
      pick.update(state: "paid", transac_detail: charge.to_json)
      Order.create(pick_id: pick.id, campaign_id: campaign.id, pro_id: campaign.product.pro.id)
      CampaignMailer.success_later(user.id, campaign.id, pick.id).deliver_later
    rescue
      pick.update(state: "error")
      CampaignMailer.payment_error(user.id, campaign.id, pick.id).deliver_later
    end

  end
end
