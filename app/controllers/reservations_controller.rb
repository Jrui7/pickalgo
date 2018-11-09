class ReservationsController < ApplicationController
  before_action :set_pick, only: [:new, :create]
  skip_after_action :verify_authorized


  def new
    @user = current_user
    @user.address.present? ? @address = @user.address : @address = Address.new
    @product = @pick.campaign.product
    unless @user.customer_id.blank?
      @customer_infos = Stripe::Customer.retrieve(@user.customer_id).sources.data[0]
    end
  end

  def create
    @user = current_user
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

    elsif params[:stripeToken]
      card = params[:stripeToken]
      cu = Stripe::Customer.retrieve("#{@user.customer_id}")
      cu.sources.create(source: card)
      card = Stripe::Token.retrieve(card)["card"]
      cu.default_source = card
      cu.save

    else
      customer_id = @user.customer_id
      card = Stripe::Customer.retrieve(customer_id)["sources"]["data"].first
    end
    delivery_infos = {first_name: pick_address.first_name, last_name: pick_address.last_name, street: pick_address.street, address_complement: pick_address.address_complement, zip_code: pick_address.zip_code, city: pick_address.city, phone_number: pick_address.phone_number}
    @pick.update(card: card, delivery_infos: delivery_infos)
    redirect_to pick_path(@pick), :flash => { :notice => "Réservation enregistrée" }

    rescue Stripe::CardError => e
    flash[:alert] = e.message
    redirect_to new_pick_reservation_path(@pick)

  end


  private

    def set_pick
      #the where condition prevents user that answered no to be able to make a reservation as state can not be pending
      @pick = Pick.where(state: "pending").find(params[:pick_id])
    end


end
