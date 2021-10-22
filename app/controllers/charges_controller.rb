class ChargesController < ApplicationController
  before_action :authenticate_user!
  include CurrentCart
  before_action :set_cart, only: [:new, :create]

  def new
  end

  def create
    # Amount in cents
    @amount = (@cart.total * 100).to_i

    customer = Stripe::Customer.create({
      email: params[:stripeEmail],
      source: params[:stripeToken],
    })

    charge = Stripe::Charge.create({
      customer: customer.id,
      amount: @amount,
      description: 'Rails Stripe customer',
      currency: 'usd',
    })
    @order = Order.find(params[:order_id])
    @order.update(status: "payed")
    PayementMailer.with(order: @order ).paiement_email.deliver_now
    @cart.destroy
    session.delete(:cart_id)
    redirect_to request.referrer, notice:"Paiement accepté !"

  rescue Stripe::CardError => e
    flash[:error] = e.message
  end
end
