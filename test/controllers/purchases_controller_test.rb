require 'test_helper'

class PurchasesControllerTest < ActionController::TestCase
  setup do
    create_items
    create_purchases
  end

  teardown do
    destroy_items
    destroy_purchases
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:purchases)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create a new purchase" do
    assert_difference('Purchase.count') do
      post :create, purchase: { item_id: @basic_pieces.id, quantity: 51 }
    end
    assert_redirected_to purchases_path
    assert_equal "Successfully added a purchase for 51 Basic Chess Pieces.", flash[:notice]
    post :create, purchase: { item_id: @basic_pieces.id, quantity: 50.75 }
    assert_template :new
  end
end