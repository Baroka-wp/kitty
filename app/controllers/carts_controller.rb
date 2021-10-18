class CartsController < ApplicationController
  before_action :authenticate_user!
  rescue_from ActiveRecord::RecordNotFound, with: :cart_not_found
  before_action :set_cart, only: %i[ show edit update destroy ]
  before_action :check_user, only: %i[ show destroy]
  layout :resolve_layout

  # GET /carts or /carts.json
  def index
    @carts = Cart.all
  end

  # GET /carts/1 or /carts/1.json
  def show
  end

  # GET /carts/new
  def new
    @cart = Cart.new
  end

  # GET /carts/1/edit
  def edit
  end

  # POST /carts or /carts.json
  def create
    @cart = Cart.new(cart_params)
    respond_to do |format|
      if @cart.save
        format.html { redirect_to @cart, notice: "Cart was successfully created." }
        format.json { render :show, status: :created, location: @cart }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /carts/1 or /carts/1.json
  def update
    respond_to do |format|
      if @cart.update(cart_params)
        format.html { redirect_to @cart, notice: "Cart was successfully updated." }
        format.json { render :show, status: :ok, location: @cart }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /carts/1 or /carts/1.json
  def destroy
    return unless @cart.id == session[:cart_id]
    @cart.destroy
    session.delete(:cart_id)
    respond_to do |format|
      #format.js
      format.html { redirect_to root_url, notice: "Cart was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

    def cart_not_found
      redirect_to root_url, alert: t(".cart_not_found")
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_cart
      @cart = Cart.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def cart_params
      params.fetch(:cart, {})
    end
    def check_user
      if @cart.user_id != current_user.id
        redirect_to root_url
      end
    end

    # carte layout
    def resolve_layout
      case action_name
      when 'show'
        if current_user.profil.nil?
          'home'
        else
          'profil'
        end
      end
    end
end
