class ChatMailer < ApplicationMailer
  def new_chat_email
    @order = params[:order]
    @seller_mail = params[:seller_mail]
    @chat = params[:chat]

    mail(to: "#{@order.email}, #{@seller_mail}", subject: " 📩 Samurai e-job : Nouveau message")
  end
end
