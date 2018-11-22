class ShareImage
  include ActiveModel::Model
  attr_accessor :image_id, :email_message, :email_recipients

  validates :image_id, presence: true
  validates :email_recipients, presence: true
  validate :verify_email_addresses

  def verify_email_addresses
    return if email_recipients.blank?
    email_recipients.split(/,\s*/).each do |email|
      errors.add(:email_recipients, "#{email} is not a valid email") unless email =~ URI::MailTo::EMAIL_REGEXP
    end
  end
end
