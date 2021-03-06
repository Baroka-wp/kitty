class ProfilsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_profil, only: %i[ show edit update destroy ]
  before_action :check_user, only: [:index]
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
    @profil.status = "pending"
    respond_to do |format|
      if @profil.save
        ProfilMailer.with(profil: @profil).new_profil_email.deliver_now
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
        @user_email = @profil.user.email
        ProfilMailer.with(profil: @profil, user_email:@user_email).update_profil_email.deliver_now

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
    def check_user
      if current_user.email != "birotori@gmail.com"
        redirect_to root_path
      end
    end
    def set_profil
      @profil = current_user.profil
    end
    def set_profil_for_admin
      @profil = Profil.find(params[:id])
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
