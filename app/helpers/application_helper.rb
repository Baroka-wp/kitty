module ApplicationHelper

  def user_has_profil?
    if user_signed_in?
      if current_user.profil.nil?
        return false
      else
        return true
      end
    end
  end
end
