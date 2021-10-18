class ChargesController < ApplicationController
  before_action :authenticate_user!
  include CurrentCart
  before_action :set_cart, only: [:new, :create]

  def new
  end

  def create
    # Amount in cents
    @amount = (@cart.ttc * 100).to_i

    customer = Stripe::Customer.create({
      email: params[:stripeEmail],
      source: params[:stripeToken],
    })

    charge = Stripe::Charge.create({
      customer: customer.id,
      amount: @amount,
      description: 'Rails Stripe customer',
      currency: 'eur',
    })
    @order = Order.find(params[:order_id])
    @order.update(status: "Payed")
    #@cart.line_items.destroy_all
    #session.delete(:cart_id)
    redirect_to request.referrer

  rescue Stripe::CardError => e
    flash[:error] = e.message
  end
end
