class OrdersController < ApplicationController
  before_action :set_pick, only: [:create]
  skip_after_action :verify_authorized
  before_action :authenticate_pro!, only: [:show, :update]
  skip_before_action :authenticate_user!, only: [:show, :update]


  def create
    @user = @pick.user
    pick_address = @user.address

    if @user.customer_id.blank?
      card = params[:stripeToken]
      customer = Stripe::Customer.create(
        source: card,
        email:  nil
      )

      customer_id = customer.id
      @user.customer_id = customer_id
      @user.save
      card = Stripe::Token.retrieve(card)["card"]

    else params[:stripeToken]
      card = params[:stripeToken]
      cu = Stripe::Customer.retrieve("#{@user.customer_id}")
      cu.sources.create(source: card)
      card = Stripe::Token.retrieve(card)["card"]
      cu.default_source = card
      cu.save
    end
    delivery_infos = {first_name: pick_address.first_name, last_name: pick_address.last_name, street: pick_address.street, address_complement: pick_address.address_complement, zip_code: pick_address.zip_code, city: pick_address.city, phone_number: pick_address.phone_number}
    @pick.update(card: card, delivery_infos: delivery_infos)
    ProceedLaterPaymentJob.perform_later(@pick.id, @pick.campaign.id)
    redirect_to pick_path(@pick), :flash => { :notice => "Paiement validé" }

    rescue Stripe::CardError => e
    flash[:alert] = e.message
    redirect_to edit_pick_path(@pick)
  end

  def show
    @order = Order.find(params[:id])
    @pick = @order.pick
    @campaign = @pick.campaign
    @product = @campaign.product
    @page = "order"
    @pro = current_pro
  end

  def update
    @order = Order.find(params[:id])
    if @order.update(order_params)
      flash[:notice] = "Modification enregistrée"
      redirect_to all_orders_pro_path(current_pro)
    else
      flash[:alert] = "Erreur"
      render :show
    end
  end





  private

    def set_pick
      @pick = Pick.find(params[:pick_id])
    end

    def order_params
      params.require(:order).permit(:completed)
    end

end
