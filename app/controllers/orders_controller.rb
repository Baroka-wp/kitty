class OrdersController < ApplicationController
  before_action :authenticate_user!
  include CurrentCart
  before_action :set_cart
  before_action :redirect_if_card_is_empty, only: [:new]
  before_action :set_order, only: %i[ show edit update destroy validate_order ]
  before_action :check_user, only: [:show, :edit, :update, :destroy, :validate_order]

  def index
    @orders = Order.all
  end

  # GET /orders/1 or /orders/1.json
  def show
  end

  # GET /orders/new
  def new
    @order = current_user.orders.new
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders or /orders.json
  def create
    @order = current_user.orders.new(order_params)
    @order.status = "ordered"
    @order.cart_id = @cart.id
    @order.product_name = @cart.line_item.product.title
    @order.cart_total = @cart.line_item.product.price
    @order.cart_product_id = @cart.line_item.product.id
    @order.buyer = current_user.profil.name
    @order.seller_id = @cart.line_item.product.user.id

    @seller_mail = @cart.line_item.product.user.email
    respond_to do |format|
      if @order.save
        OrderMailer.with(order: @order, seller_mail: @seller_mail ).new_order_email.deliver_now
        format.html { redirect_to @order, notice: "Commande validée." }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  def validate_order
    @order.update(status: params[:status])
    redirect_to request.referrer
  end

  # PATCH/PUT /orders/1 or /orders/1.json
  def update
    @order.user_id = current_user.id
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: "Order was successfully updated." }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1 or /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: "Order was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end
    # Only allow a list of trusted parameters through.
    def order_params
      params.require(:order).permit(:first_name, :last_name, :email, :adresse, :status)
    end
    def redirect_if_card_is_empty
      if @cart.line_item.nil?
        redirect_to root_path, notice: "Panier vide"
      end
    end

    def check_user
      unless @order.user_id == current_user.id || @order.seller_id == current_user.id
        redirect_to orders_path
      end
    end
end
