class NotificationsMailer < ApplicationMailer
  default from: Rails.application.secrets.email

  def notifications_email(user)
    @users = user
    @url = Rails.application.secrets.url
    mail(to: @users.email, subject: 'У вас есть непроверенные карточки')
  end
end
