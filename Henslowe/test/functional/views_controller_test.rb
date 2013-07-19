require 'test_helper'

class ViewsControllerTest < ActionController::TestCase
  test "should get Jobs" do
    get :Jobs
    assert_response :success
  end

end
