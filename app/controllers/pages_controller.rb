class PagesController < ApplicationController
  before_action :authenticate_user!
  before_action :check_if_user_profil_present!
  layout "profil"


  def buy
    @orders = current_user.orders
  end

  def sell
    @sells = Order.where(seller_id: current_user.id)

    @sells_validate = Order.where(seller_id: current_user.id, status: "sent")
    @solde = @sells_validate.to_a.sum(&:cart_total)
  end

  def panier
  end

  def product
    @products = current_user.products
  end

  def retrait
  end
end
