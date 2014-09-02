require 'test_helper'

class PricesControllerTest < ActionController::TestCase
  setup do
    @price = prices(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:prices)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create price" do
    assert_difference('Price.count') do
      post :create, price: { difference1_4: @price.difference1_4, difference5_99: @price.difference5_99, format: @price.format, price1_4: @price.price1_4, price5_99: @price.price5_99, type_paper: @price.type_paper, type_photo: @price.type_photo }
    end

    assert_redirected_to price_path(assigns(:price))
  end

  test "should show price" do
    get :show, id: @price
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @price
    assert_response :success
  end

  test "should update price" do
    patch :update, id: @price, price: { difference1_4: @price.difference1_4, difference5_99: @price.difference5_99, format: @price.format, price1_4: @price.price1_4, price5_99: @price.price5_99, type_paper: @price.type_paper, type_photo: @price.type_photo }
    assert_redirected_to price_path(assigns(:price))
  end

  test "should destroy price" do
    assert_difference('Price.count', -1) do
      delete :destroy, id: @price
    end

    assert_redirected_to prices_path
  end
end
