require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest

  def setup
    @base_title = "MoviePresentation"
  end

  test "should get new" do
    get signup_path
    assert_response :success
    assert_select "title", "New | #{@base_title}"
  end

end
