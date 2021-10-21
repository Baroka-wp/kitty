# Preview all emails at http://localhost:3000/rails/mailers/payement_mailer
class PayementMailerPreview < ActionMailer::Preview
  def paiement_email
    # Set up a temporary order for the preview
    order = Order.new(first_name: "Joe Smith", email: "joe@gmail.com", adresse: "1-2-3 Chuo, Tokyo, 333-0000", product_name: "I want to place an order!")

    PayementMailer.with(order: order).paiement_email
  end
end
