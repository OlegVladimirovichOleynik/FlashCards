class UserMailer < ApplicationMailer
  def welcome_email(users)
      mail(to: users.email, subject: "У Вас есть непроверенные карточки")
  end
end
