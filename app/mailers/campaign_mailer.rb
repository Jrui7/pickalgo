class CampaignMailer < ApplicationMailer
  def success(user_id, campaign_id, pick_id)
    @user = User.find(user_id)
    @campaign = Campaign.find(campaign_id)
    @pick = Pick.find(pick_id)
    mail to: @user.email, subject: "Commande confirmée", from: '"Pickalgo" <contact@pickalgo.com>'
  end

  def success_open(user_id, campaign_id, pick_id)
    @user = User.find(user_id)
    @campaign = Campaign.find(campaign_id)
    @pick = Pick.find(pick_id)
    mail to: @user.email, subject: "Commande confirmée", from: '"Pickalgo" <contact@pickalgo.com>'
  end

    def success_later(user_id, campaign_id, pick_id)
    @user = User.find(user_id)
    @campaign = Campaign.find(campaign_id)
    @pick = Pick.find(pick_id)
    mail to: @user.email, subject: "Commande confirmée", from: '"Pickalgo" <contact@pickalgo.com>'
  end

  def payment_error(user_id, campaign_id, pick_id)
    @user = User.find(user_id)
    @pick = Pick.find(pick_id)
    @campaign = Campaign.find(campaign_id)
    mail to: @user.email, subject: "Erreur de paiement", from: '"Pickalgo" <contact@pickalgo.com>'
  end

  def failed_open(pick_id, campaign_id)
    @pick = Pick.find(pick_id)
    @campaign = Campaign.find(campaign_id)
    @user = @pick.user
    mail to: @user.email, subject: "Proposition non retenue", from: '"Pickalgo" <contact@pickalgo.com>'
  end

  def desavantage_pick(user_id, campaign_id, pick_id)
    @user = User.find(user_id)
    @pick = Pick.find(pick_id)
    @campaign = Campaign.find(campaign_id)
    mail to: @user.email, subject: "La meilleure offre pour #{@campaign.product.title} est...", from: '"Pickalgo" <contact@pickalgo.com>'
  end

end

