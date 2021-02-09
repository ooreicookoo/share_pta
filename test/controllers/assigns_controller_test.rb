require 'test_helper'

class AssignsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get assigns_create_url
    assert_response :success
  end

end
