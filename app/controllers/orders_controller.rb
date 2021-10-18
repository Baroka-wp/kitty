class OrdersController < ApplicationController
  before_action :authenticate_user!
  include CurrentCart
  before_action :set_cart
  before_action :redirect_if_card_is_empty, only: [:new]
  before_action :set_order, only: %i[ show edit update destroy ]
  before_action :check_user, only: [:edit, :update, :destroy]

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
    respond_to do |format|
      if @order.save
        #session.delete(:cart_id)
        format.html { redirect_to @order, notice: "Commande validée." }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  def capture_order
    # PAYPAL CAPTURE ORDER
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
      if @cart.line_items.empty?
        redirect_to root_path, notice: "Panier vide"
      end
    end

    def check_user
      if @order.user_id != current_user.id
        redirect_to orders_path
      end
    end
end
