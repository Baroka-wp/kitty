module ProfilsHelper

  def current_profil_path
    if current_user.profil.nil?
      new_profil_path
    else
      @current_profil = current_user.profil.id
      profil_path(@current_profil)
    end
  end

end
