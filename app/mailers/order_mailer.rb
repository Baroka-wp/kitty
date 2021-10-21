class OrderMailer < ApplicationMailer
  def new_order_email
    @order = params[:order]
    @seller_mail = params[:seller_mail]
    mail(to: "sashimiyashi@gmail.com, #{@order.email}, #{@seller_mail}", subject: "Samurai e-job : Nouvelle commande")
  end
end
