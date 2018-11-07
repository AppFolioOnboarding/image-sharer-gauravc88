require 'test_helper'

class ImagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @valid_url = 'https://homersimpson.jpg'
    @url0 = 'https://test0.jpg'
    @url1 = 'https://test1.jpg'
    @url2 = 'https://test2.jpg'
    @invalid_url = 'ftp://blah.xyz'
    @image0 = Image.create(url: @url0)
    @image1 = Image.create(url: @url1)
    @image2 = Image.create(url: @url2)
  end

  def test_new
    get new_image_path
    assert_response :ok
    assert_select 'h2', 'Add a new Image'
    assert_select 'a[href="/images"]', count: 1
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
    assert_select 'a[href="/images/new"]', count: 1
  end

  def test_create_success
    assert_difference('Image.count', 1) do
      image_params = { url: @valid_url }
      post images_path, params: { image: image_params }
    end
    assert_redirected_to image_path(Image.last)
    get image_path(Image.last.id)
    assert_select 'div.notice', value: 'Image saved'
  end

  def test_create_failure
    assert_no_difference('Image.count') do
      image_params = { url: @invalid_url }
      post images_path, params: { image: image_params }
    end
    assert_response :ok
    assert_select 'div#error_explanation' do |elements|
      elements.each do |element|
        assert_select element, 'li', 2
      end
    end
    assert_select 'div.field_with_errors' do |elements|
      elements.each do
        assert_select 'input[type=text]', value: @invalid_url
      end
    end
  end

  def test_show
    get image_path(@image0.id)
    assert_response :ok
    assert_select 'img', count: 1
    assert_select 'a[href="/images"]', count: 1
    assert_select 'a[href="/images/new"]', count: 1
  end
end
