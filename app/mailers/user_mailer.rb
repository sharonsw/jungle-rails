class UserMailer < ApplicationMailer
  def confirm_order_email(user)
    @user = user
    @url  = 'http://localhost:3030/orders/'
    mail(to: @user.email, subject: 'Thank you for your order! ')
  end
end
