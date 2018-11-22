require 'uri'

class ImageMailer < ApplicationMailer
  def share_image_email(image, email_recipients, email_message, app_url)
    @image = image
    @email_recipients = email_recipients
    @email_message = email_message
    @app_url = app_url
    parsed_uri = URI.parse(@image.url)
    puts 'Hi there, this is a test'
    puts @image
    puts parsed_uri
    #attachments.inline['file.jpg'] = URI(@image.url)
    mail(to: email_recipients, subject: 'Welcome to image sharing')
  end
end
