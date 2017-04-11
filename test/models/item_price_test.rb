require 'test_helper'

class ItemPriceTest < ActiveSupport::TestCase
  # test relationships
  should belong_to(:item)

  # test validations with matchers
  should validate_numericality_of(:price).is_greater_than_or_equal_to(0)
  should validate_inclusion_of(:category).in_array(ItemPrice::CATEGORIES.to_h.values)
  should allow_value(Date.current).for(:start_date)
  should allow_value(1.day.ago.to_date).for(:start_date)
  should_not allow_value(1.day.from_now.to_date).for(:start_date)

  # set up context
  context "Within context" do
    setup do 
      create_pieces
      create_piece_prices_wholesale
    end
    
    teardown do
      destroy_pieces
      destroy_piece_prices_wholesale
    end

    should "check to make sure the end date is after the start date" do
      @bad_price = FactoryGirl.build(:item_price, item: @weighted_pieces, price: 10.95, start_date: 9.days.ago.to_date, end_date: 10.days.ago.to_date)
      deny @bad_price.valid?
    end 

    should "verify that the item is active in the system" do
      @bad_price = FactoryGirl.build(:item_price, item: @zagreb_pieces, price: 29.95)
      deny @bad_price.valid?
    end 

    should "verify that the old price end_date set to today" do
      assert_nil @wtp3_w.end_date
      @change_price = FactoryGirl.create(:item_price, item: @weighted_pieces, price: 10.95)
      @wtp3_w.reload
      assert_equal Date.current, @wtp3_w.end_date
    end

    should "have a working scope called current" do
      assert_equal [4.95, 8.95, 16.95], ItemPrice.current.all.map(&:price).sort
    end

    should "have a working scope called chronological" do
      assert_equal [4.95, 4.5, 16.95, 8.95, 4.95, 14.95, 7.5, 4.25, 12.95, 6.95, 3.95], ItemPrice.chronological.all.map(&:price)
    end

    should "have a working scope called for_date" do
      assert_equal [4.25, 7.50, 14.95], ItemPrice.for_date(9.months.ago.to_date).all.map(&:price).sort
    end

    should "have a working scope called for_item" do
      assert_equal [6.95, 7.50, 8.95], ItemPrice.for_item(@weighted_pieces.id).all.map(&:price).sort
    end

    should "have a working scope called wholesale" do
      create_piece_prices_manufacturer
      assert_equal [3.95, 4.25, 4.50, 4.95, 4.95, 6.95, 7.50, 8.95, 12.95, 14.95, 16.95], ItemPrice.wholesale.all.map(&:price).sort
      destroy_piece_prices_manufacturer
    end

    should "have a working scope called manufacturer" do
      create_piece_prices_manufacturer
      assert_equal [1.95, 2.25, 2.50, 2.95, 3.50, 4.50, 5.95, 6.25, 7.50], ItemPrice.manufacturer.all.map(&:price).sort
      destroy_piece_prices_manufacturer
    end

    should "correctly assess that an item_price is not destroyable" do
      deny @wtp3_w.destroy
    end

  end
end
