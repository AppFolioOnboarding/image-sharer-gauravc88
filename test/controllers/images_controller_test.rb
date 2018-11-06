require 'test_helper'

class ImagesControllerTest < ActionDispatch::IntegrationTest
  def test_new
    get new_image_path
    assert_response :ok
    assert_select 'h2', 'Add a new Image'
  end
end
