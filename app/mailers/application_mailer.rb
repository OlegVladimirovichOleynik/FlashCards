require "mandrill"

class BaseMandrillMailer < ActionMailer::Base
  default from: Rails.application.secrets.email

  private

  def send_mail(email, subject)
    mail(to: email, subject: subject, content_type: "text/html")
  end

  def mandrill_template(template_name, attributes)
    mandrill = Mandrill::API.new(ENV["SMTP_PASSWORD"])

    merge_vars = attributes.map do |key, value|
      { name: key, content: value }
    end

    mandrill.templates.render(template_name, [], merge_vars)["html"]
  end
end
