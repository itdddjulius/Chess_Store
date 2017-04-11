require 'test_helper'

class ItemsControllerTest < ActionController::TestCase
  setup do
    create_pieces
  end

  teardown do
    destroy_pieces
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:boards)
    assert_not_nil assigns(:pieces)
    assert_not_nil assigns(:clocks)
    assert_not_nil assigns(:supplies)
    assert_not_nil assigns(:inactive_items)
    assert_equal ["Basic Chess Pieces", "Weighted Chess Pieces", "Wooden Chess Pieces"], assigns(:pieces).map(&:name).sort
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create a new item" do
    assert_difference('Item.count') do
      post :create, item: { active: @basic_pieces.active, name: "Large Basic Pieces", description: "Just like the basic pieces, only bigger.", color: @basic_pieces.color, category: @basic_pieces.category, weight: @basic_pieces.weight, inventory_level: @basic_pieces.inventory_level, reorder_level: @basic_pieces.reorder_level }
    end
    assert_redirected_to item_path(assigns(:item))
    assert_equal "Successfully created Large Basic Pieces.", flash[:notice]
    post :create, item: { active: @basic_pieces.active, color: @basic_pieces.color, category: @basic_pieces.category, weight: 0, inventory_level: @basic_pieces.inventory_level, reorder_level: @basic_pieces.reorder_level }
    assert_template :new
  end

  test "should show item and the price history for the item" do
    create_piece_prices_manufacturer
    get :show, id: @basic_pieces
    assert_not_nil assigns(:item)
    assert_not_nil assigns(:price_history)
    assert_not_nil assigns(:similar_items)
    assert_response :success
    destroy_piece_prices_manufacturer
  end

  test "should get edit" do
    get :edit, id: @basic_pieces
    assert_not_nil assigns(:item)
    assert_response :success
  end

  test "should update an item" do
    patch :update, id: @basic_pieces, item: { active: @basic_pieces.active, name: "Plastic Chess Pieces", description: @basic_pieces.description, color: @basic_pieces.color, category: @basic_pieces.category, weight: @basic_pieces.weight, inventory_level: @basic_pieces.inventory_level, reorder_level: @basic_pieces.reorder_level }
    assert_redirected_to item_path(assigns(:item))
    assert_equal "Successfully updated Plastic Chess Pieces.", flash[:notice]
    patch :update, id: @basic_pieces, item: { active: @basic_pieces.active, name: @basic_pieces.name, description: @basic_pieces.description, color: @basic_pieces.color, category: @basic_pieces.category, weight: -1.0, inventory_level: @basic_pieces.inventory_level, reorder_level: @basic_pieces.reorder_level }
    assert_template :edit
  end

  test "should destroy item" do
    ## In later phases there will be different rules for deleting items, but for now it's just a simple destroy
    assert_difference('Item.count', -1) do
      delete :destroy, id: @basic_pieces
    end
    assert_redirected_to items_path
    assert_equal "Successfully removed Basic Chess Pieces from the system.", flash[:notice]
  end
end

