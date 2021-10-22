# Preview all emails at http://localhost:3000/rails/mailers/profil_mailer
class ProfilMailerPreview < ActionMailer::Preview

  def new_profil_email
    # Set up a temporary order for the preview
    @profil = Profil.new(name: "Joe Smith", telephone: "67153974", doc_type: "CNI", bio: "I want to place an order!")

    ProfilMailer.with(profil: @profil).new_profil_email
  end

end
