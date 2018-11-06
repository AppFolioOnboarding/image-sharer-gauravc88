require 'test_helper'

class ApplicationControllerTest < ActionDispatch::IntegrationTest
  def test_home
    get root_url
    assert_response :success
    assert_select 'form', count: 1
    assert_select 'form label', 'Image url'
    assert_select 'form input[type=text]', count: 1
    assert_select 'form input[type=submit]', count: 1
  end
end
