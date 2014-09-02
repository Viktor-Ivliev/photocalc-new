require 'test_helper'

class OrderDatesControllerTest < ActionController::TestCase
  setup do
    @order_date = order_dates(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:order_dates)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create order_date" do
    assert_difference('OrderDate.count') do
      post :create, order_date: { date: @order_date.date, info: @order_date.info }
    end

    assert_redirected_to order_date_path(assigns(:order_date))
  end

  test "should show order_date" do
    get :show, id: @order_date
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @order_date
    assert_response :success
  end

  test "should update order_date" do
    patch :update, id: @order_date, order_date: { date: @order_date.date, info: @order_date.info }
    assert_redirected_to order_date_path(assigns(:order_date))
  end

  test "should destroy order_date" do
    assert_difference('OrderDate.count', -1) do
      delete :destroy, id: @order_date
    end

    assert_redirected_to order_dates_path
  end
end
