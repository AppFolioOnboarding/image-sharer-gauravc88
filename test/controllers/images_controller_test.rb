# rubocop:disable Metrics/LineLength
require 'test_helper'

class ImagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @valid_url = 'https://homersimpson.jpg'
    @valid_tags = 'test, homer, donuts'
    @url0 = 'https://test0.jpg'
    @tags0 = 'race, coffee'
    @url1 = 'https://test1.jpg'
    @tags1 = 'beer, wine'
    @url2 = 'https://test2.jpg'
    @tags2 = 'trash'
    @tags = %w[trash beer wine race coffee]
    @invalid_url = 'ftp://blah.xyz'
    @image0 = Image.create(url: @url0, tag_list: @tags0)
    @image1 = Image.create(url: @url1, tag_list: @tags1)
    @image2 = Image.create(url: @url2, tag_list: @tags2)
  end

  def test_new
    get new_image_path
    assert_response :ok
    assert_select 'h2', 'Add a new Image'
    assert_select 'a[href="/images"]', count: 2
  end

  def test_index
    get images_path
    assert_response :ok
    assert_select 'h2', 'Stored Images'
    assert_select 'img', count: 3
    assert_select 'img' do |imgs|
      img_urls = imgs.map { |img| img['src'] }
      expected_urls = [@url2, @url1, @url0]
      assert_equal img_urls, expected_urls
    end
    assert_select 'div.card-text a' do |tags|
      tags.each_with_index do |tag, index|
        assert_equal '#' + @tags[index], tag.text
      end
    end
    assert_select 'a[href="/images/new"]', count: 2
  end

  def test_create_success
    assert_difference('Image.count', 1) do
      image_params = { url: @valid_url, tag_list: @valid_tags }
      post images_path, params: { image: image_params }
    end
    assert_redirected_to image_path(Image.last)
    get image_path(Image.last.id)
    assert_select 'div.alert', value: 'Image saved'
    assert_select 'p#image-tags', value: @valid_tags
  end

  def test_create_failure
    assert_no_difference('Image.count') do
      image_params = { url: @invalid_url }
      post images_path, params: { image: image_params }
    end
    assert_response :ok
    assert_select 'div.invalid-feedback', value: 'Url must start with http or https and Url must have a valid extension'
  end

  def test_show
    get image_path(@image0.id)
    assert_response :ok
    assert_select 'img', count: 1
    assert_select 'p#image-tags', value: @valid_tags
    assert_select 'a[href="/images"]', count: 2
    assert_select 'a[href="/images/new"]', count: 2
  end
end
# rubocop:enable Metrics/LineLength
