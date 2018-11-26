require 'test_helper'

class ShareImageTest < ActiveSupport::TestCase
  def test_nil_image_id
    share_image = ShareImage.new(image_id: nil)
    assert_not share_image.valid?
  end

  def test_nil_email_recipients
    share_image = ShareImage.new(image_id: 1, email_recipients: nil)
    assert_not share_image.valid?
    assert_equal "can't be blank", share_image.errors.messages[:email_recipients][0]
  end

  def test_invalid_email_addresses
    share_image = ShareImage.new(image_id: 1, email_recipients: 'abc@xyz.com, a!')
    assert_not share_image.valid?
    assert_equal 'a! is not a valid email', share_image.errors.messages[:email_recipients][0]
  end

  def test_valid_share_image
    share_image = ShareImage.new(image_id: 1, email_message: 'Test', email_recipients: 'abc@xyz.com')
    assert share_image.valid?
    assert_equal 'abc@xyz.com', share_image.email_recipients
    assert_equal 'Test', share_image.email_message
    assert_equal 1, share_image.image_id
  end
end
