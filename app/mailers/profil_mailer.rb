class ProfilMailer < ApplicationMailer

  def new_profil_email
    @profil = params[:profil]
    mail(to: "sashimiyashi@gmail.com", subject: "Samurai e-job : Un profil a besoin d'attention")
  end
  
  def update_profil_email
    @profil = params[:profil]
    @user_email = params[:user_email]
    mail(to: "#{@user_email}", subject: "Samurai e-job : votre profil a ete mis a jour")
  end
end
