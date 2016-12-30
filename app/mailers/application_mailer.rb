require "mandrill"
class ApplicationMailer < ActionMailer::Base
  default from: Rails.application.secrets.email

  private

  def send_mail(email, subject, body)
    mail(to: email, subject: subject, body: body, content_type: "text/html")
  end

  def mandrill_client
    @mandrill_client = Mandrill::API.new(ENV["SMTP_PASSWORD"])
  end
end
