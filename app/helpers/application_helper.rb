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

  def flash_class(level)
  bootstrap_alert_class = {
    "success" => "alert-success",
    "error" => "alert-danger",
    "notice" => "alert-info",
    "alert" => "alert-danger",
    "warn" => "alert-warning"
  }
  bootstrap_alert_class[level]
end
end
