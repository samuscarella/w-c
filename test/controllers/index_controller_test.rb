require 'test_helper'

class IndexControllerTest < ActionController::TestCase
  test "should get dash" do
    get :dash
    assert_response :success
  end

  test "should get myWorkouts" do
    get :myWorkouts
    assert_response :success
  end

end
