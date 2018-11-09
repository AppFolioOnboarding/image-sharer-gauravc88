require 'test_helper'

class ImageTest < ActiveSupport::TestCase
  def test_nil_url
    image = Image.new(url: nil)
    assert_not image.valid?
  end

  def test_valid_url
    image = Image.new(url: 'http://test.png')
    assert image.valid?
    assert image.errors.count.zero?
  end

  def test_image__tags_saved
    image = Image.new(url: 'http://test.png', tag_list: 'test, race, coffee')
    assert image.valid?
    assert_equal %w[test race coffee], image.tag_list
    assert image.errors.count.zero?
  end

  def test_invalid_starting
    image = Image.new(url: 'ftp://test.jpg')
    assert_not image.valid?
    assert_not image.errors.count.zero?
    assert_equal 'must start with http or https', image.errors.messages[:url][0]
  end

  def test_invalid_extension
    image = Image.new(url: 'http://test.xyz')
    assert_not image.valid?
    assert_not image.errors.count.zero?
    assert_equal 'must have a valid extension', image.errors.messages[:url][0]
  end
end
