class UserMailer < ApplicationMailer
  def confirm_order_email(order)
    @order = order
    @url  = order_url(id: @order.id)
    mail(to: @order.email, subject: "[Order no: #{@order.id}] | Thank you for your order! ")
  end
end
