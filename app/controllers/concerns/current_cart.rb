module CurrentCart

private

  def set_cart
    if user_signed_in?
    @cart = current_user.carts.find_by(user_id: current_user) || current_user.carts.create
    session[:cart_id] ||= @cart.id
    end
  end
end
