class NotificationsMailer < BaseMandrillMailer
  default from: Rails.application.secrets.email

  def notifications_email(user)
    @users = user
    @url = Rails.application.secrets.url
    subject = 'У вас есть непроверенные карточки'
    send_mail(@users.email, subject)
  end
end
