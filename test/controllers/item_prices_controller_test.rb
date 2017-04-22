require 'test_helper'

class ItemPricesControllerTest < ActionController::TestCase
  setup do
    create_pieces
    create_piece_prices_manufacturer
  end

  teardown do
    destroy_pieces
    destroy_piece_prices_manufacturer
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:active_items)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create a new item price" do
    assert_difference('ItemPrice.count') do
      post :create, item_price: { item_id: @basic_pieces.id, price: 2.95, start_date: Date.current, category: 'manufacturer' }
    end
    assert_redirected_to item_path(assigns(:item))
    assert_equal "Changed the price of Basic Chess Pieces.", flash[:notice]
    post :create, item_price: { item_id: @basic_pieces.id, price: -2.50, start_date: Date.current, category: 'manufacturer' }
    assert_template :new
  end
end