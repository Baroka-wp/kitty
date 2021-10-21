class PayementMailer < ApplicationMailer

  def paiement_email
    @order = params[:order]
    mail(to: "#{@order.email}", subject: "Samurai e-job : Votre paiement est acceptée")
  end
end
