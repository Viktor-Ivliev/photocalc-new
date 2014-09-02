require 'test_helper'

class LandingPageControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get photobook" do
    get :photobook
    assert_response :success
  end

  test "should get printbook" do
    get :printbook
    assert_response :success
  end

  test "should get slimbook" do
    get :slimbook
    assert_response :success
  end

  test "should get planshet" do
    get :planshet
    assert_response :success
  end

end
