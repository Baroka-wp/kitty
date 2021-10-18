class ProfilsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_profil, only: %i[ show edit update destroy ]
  layout :resolve_layout
  # GET /profils or /profils.json
  def index
    @profils = Profil.all
  end

  # GET /profils/1 or /profils/1.json
  def show
  end

  # GET /profils/new
  def new
    @profil = Profil.new
  end

  # GET /profils/1/edit
  def edit
  end

  # POST /profils or /profils.json
  def create
    @profil = Profil.new(profil_params)
    @profil.user_id = current_user.id

    respond_to do |format|
      if @profil.save
        format.html { redirect_to @profil, notice: "Profil was successfully created." }
        format.json { render :show, status: :created, location: @profil }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @profil.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /profils/1 or /profils/1.json
  def update
    respond_to do |format|
      if @profil.update(profil_params)
        format.html { redirect_to @profil, notice: "Profil was successfully updated." }
        format.json { render :show, status: :ok, location: @profil }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @profil.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /profils/1 or /profils/1.json
  def destroy
    @profil.destroy
    respond_to do |format|
      format.html { redirect_to profils_url, notice: "Profil was successfully destroyed." }
      format.json { head :no_content }
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_profil
      @profil = current_user.profil
    end

    # Only allow a list of trusted parameters through.
    def profil_params
      params.require(:profil).permit(:name, :bio, :telephone, :status, :document, :doc_type, :avatar)
    end

    def resolve_layout
      case action_name
      when 'new', 'create'
        'home'
      else
        'profil'
      end
    end
end
