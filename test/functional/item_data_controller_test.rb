require 'test_helper'

class ItemDataControllerTest < ActionController::TestCase
  setup do
    @item_datum = item_data(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:item_data)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create item_datum" do
    assert_difference('ItemDatum.count') do
      post :create, item_datum: @item_datum.attributes
    end

    assert_redirected_to item_datum_path(assigns(:item_datum))
  end

  test "should show item_datum" do
    get :show, id: @item_datum.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @item_datum.to_param
    assert_response :success
  end

  test "should update item_datum" do
    put :update, id: @item_datum.to_param, item_datum: @item_datum.attributes
    assert_redirected_to item_datum_path(assigns(:item_datum))
  end

  test "should destroy item_datum" do
    assert_difference('ItemDatum.count', -1) do
      delete :destroy, id: @item_datum.to_param
    end

    assert_redirected_to item_data_path
  end
end
