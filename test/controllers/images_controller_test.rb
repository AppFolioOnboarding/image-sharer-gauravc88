require 'test_helper'

class ImagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @valid_url = 'https://homersimpson.jpg'
    @invalid_url = 'ftp://blah.xyz'
    @image = Image.create(url: @valid_url)
  end

  def test_new
    get new_image_path
    assert_response :ok
    assert_select 'h2', 'Add a new Image'
  end

  def test_index
    get images_path
    assert_response :ok
    assert_select 'h2', 'Stored Images'
    assert_select 'img', count: 1
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
    get image_path(@image.id)
    assert_response :ok
    assert_select 'img', count: 1
  end
end
