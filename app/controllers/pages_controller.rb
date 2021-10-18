class PagesController < ApplicationController
  before_action :authenticate_user!
  before_action :check_if_user_profil_present!
  layout "profil"


  def buy
    @orders = current_user.orders
  end

  def sell
  end

  def panier
  end

  def product
    @products = current_user.products
  end

  def retrait
  end
end
