# Preview all emails at http://localhost:3000/rails/mailers/image_mailer
class ImageMailerPreview < ActionMailer::Preview
  def share_image_email
    image = Image.last
    email_message = 'Test email message'
    email_recipients = 'homer.simpson@springfield.com'
    url = 'https://image-sharer-gauravc88s.herokuapp.com/'
    ImageMailer.share_image_email(image, email_recipients, email_message, url)
  end
end
