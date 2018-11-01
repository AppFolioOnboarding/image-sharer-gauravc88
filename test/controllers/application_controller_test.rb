require 'test_helper'

class ApplicationControllerTest < ActionDispatch::IntegrationTest
  def test_home
    get root_url
    assert_response :success
    assert_select 'h1', count: 1
  end
end
