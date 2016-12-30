class NotificationsMailer < ApplicationMailer
  default from: Rails.application.secrets.email

  def notifications_email(user)
    @users = user
    subject = 'У вас есть непроверенные карточки'
    body = mandrill_template("Cards")
    send_mail(@users.email, subject, body)
  end
end
