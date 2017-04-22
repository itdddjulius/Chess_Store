require 'test_helper'

class PurchaseTest < ActiveSupport::TestCase
  # test relationships
  should belong_to(:item)

  # test validations with matchers
  should validate_numericality_of(:quantity).only_integer
  should allow_value(Date.current).for(:date)
  should allow_value(1.day.ago.to_date).for(:date)
  should_not allow_value(1.day.from_now.to_date).for(:date)

  # set up context
  context "Within context" do
    setup do 
      create_items
      create_purchases
    end
    
    teardown do
      destroy_items
      destroy_purchases
    end

    should "verify that the item is active in the system" do
      @bad_purchase = FactoryGirl.build(:purchase, item: @zagreb_pieces, quantity: 5)
      deny @bad_purchase.valid?
    end 

    should "have a working scope called loss" do
      assert_equal @basic_pieces, Purchase.loss.all.first.item
    end

    should "have a working scope called chronological" do
      assert_equal ["Basic Analog Chess Clock","Basic Chess Pieces","Vinyl Chess Board - Green & White","Basic Chess Pieces","Vinyl Chess Board - Green & White"], Purchase.chronological.all.map{|p| p.item.name}
    end

    should "have a working scope called for_item" do
      assert_equal 2, Purchase.for_item(@vinyl_green).count
      assert_equal 2, Purchase.for_item(@basic_pieces).count
      assert_equal 1, Purchase.for_item(@analog_clock).count
      # check the zero value for item with no purchases...
      assert_equal 0, Purchase.for_item(@weighted_pieces).count
    end

    should "have a callback that adjusts inventory levels" do
      # vinyl boards start w/ 100, add 50, add 25
      assert_equal 175, @vinyl_green.inventory_level
      # basic pieces start w/ 100, add 100, lose 10
      assert_equal 190, @basic_pieces.inventory_level
      # clocks start w/ 100, add 30
      assert_equal 130, @analog_clock.inventory_level
      # weighted pieces start w/ 100 and no change
      assert_equal 100, @weighted_pieces.inventory_level
    end
    
    should "correctly assess that a purchase is not destroyable" do
      deny @p_vboards.destroy
    end

  end
end
