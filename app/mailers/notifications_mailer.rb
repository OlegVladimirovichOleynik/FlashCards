class NotificationsMailer < ApplicationMailer
  default from: 'flashcards174@project.com'

  def notifications_email(user)
    @users = user
    @url = 'https://flashcards174.herokuapp.com/'
    mail(to: @users.email, subject: 'У вас есть непроверенные карточки')
  end
end
