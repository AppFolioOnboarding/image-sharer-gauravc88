require 'test_helper'

class ApplicationControllerTest < ActionDispatch::IntegrationTest
  def test_home
    get root_url
    assert_response :success
    assert_select 'h2', value: 'Stored Images'
    assert_select 'a[href="/images/new"]', count: 2
  end
end
