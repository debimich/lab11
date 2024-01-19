require "test_helper"

class SqrtControllerTest < ActionDispatch::IntegrationTest
  test "should get input" do
    get "/"
    assert_response :success
  end

  test "should get view" do
    get "/sqrt/view", params: { v: 5 }
    assert_response :success
  end

  test "get v = 25" do
    get "/sqrt/view", params: { v: 25 }
    target = 5.0
    assert_not_nil assigns(:guesses)
    assert_in_delta target, assigns(:guesses).last, 0.001
  end

  test "get v = 2" do
    get "/sqrt/view", params: { v: 2 }
    target = Math.sqrt(2)
    assert_not_nil assigns(:guesses)
    assert_in_delta target, assigns(:guesses).last, 0.001
  end

end
