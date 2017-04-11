module Contexts
  module ItemPrices
    # Context for item_prices (assumes items context)
    def create_item_prices
      create_wholesale_item_prices
      create_manufacturer_item_prices
    end
    
    def destroy_item_prices
      destroy_wholesale_item_prices
      destroy_manufacturer_item_prices
    end

    def create_wholesale_item_prices
      create_board_prices_wholesale
      create_piece_prices_wholesale
      create_clock_prices_wholesale
      create_supply_prices_wholesale
    end

    def create_manufacturer_item_prices
      create_board_prices_manufacturer
      create_piece_prices_manufacturer
      create_clock_prices_manufacturer
      create_supply_prices_manufacturer
    end

    def destroy_wholesale_item_prices
      destroy_board_prices_wholesale
      destroy_piece_prices_wholesale
      destroy_clock_prices_wholesale
      destroy_supply_prices_wholesale
    end

    def destroy_manufacturer_item_prices
      destroy_board_prices_manufacturer
      destroy_piece_prices_manufacturer
      destroy_clock_prices_manufacturer
      destroy_supply_prices_manufacturer
    end

    def create_board_prices_manufacturer
      @vbg1_m = FactoryGirl.create(:item_price, item: @vinyl_green, category: "manufacturer", price: 1.85, start_date: 24.months.ago.to_date)
      @vbg2_m = FactoryGirl.create(:item_price, item: @vinyl_green, category: "manufacturer", price: 2.15, start_date: 14.months.ago.to_date)
      @vbg3_m = FactoryGirl.create(:item_price, item: @vinyl_green, category: "manufacturer", price: 2.50, start_date: 6.months.ago.to_date)
      @vbg4_m = FactoryGirl.create(:item_price, item: @vinyl_green, category: "manufacturer", price: 2.75, start_date: 4.weeks.ago.to_date)

      @vbb1_m = FactoryGirl.create(:item_price, item: @vinyl_blue, category: "manufacturer", price: 2.05, start_date: 24.months.ago.to_date)
      @vbb2_m = FactoryGirl.create(:item_price, item: @vinyl_blue, category: "manufacturer", price: 2.35, start_date: 14.months.ago.to_date)
      @vbb3_m = FactoryGirl.create(:item_price, item: @vinyl_blue, category: "manufacturer", price: 2.95, start_date: 6.months.ago.to_date)
      @vbb4_m = FactoryGirl.create(:item_price, item: @vinyl_blue, category: "manufacturer", price: 3.10, start_date: 4.weeks.ago.to_date)

      @vbr1_m = FactoryGirl.create(:item_price, item: @vinyl_red, category: "manufacturer", price: 2.05, start_date: 24.months.ago.to_date)
      @vbr2_m = FactoryGirl.create(:item_price, item: @vinyl_red, category: "manufacturer", price: 2.35, start_date: 14.months.ago.to_date)
      @vbr3_m = FactoryGirl.create(:item_price, item: @vinyl_red, category: "manufacturer", price: 2.95, start_date: 6.months.ago.to_date)
      @vbr4_m = FactoryGirl.create(:item_price, item: @vinyl_red, category: "manufacturer", price: 3.10, start_date: 4.weeks.ago.to_date)

      @vbk1_m = FactoryGirl.create(:item_price, item: @vinyl_black, category: "manufacturer", price: 1.85, start_date: 24.months.ago.to_date)
      @vbk2_m = FactoryGirl.create(:item_price, item: @vinyl_black, category: "manufacturer", price: 2.15, start_date: 14.months.ago.to_date)
      @vbk3_m = FactoryGirl.create(:item_price, item: @vinyl_black, category: "manufacturer", price: 2.50, start_date: 6.months.ago.to_date)
      @vbk4_m = FactoryGirl.create(:item_price, item: @vinyl_black, category: "manufacturer", price: 2.75, start_date: 4.weeks.ago.to_date)

      @mgh1_m = FactoryGirl.create(:item_price, item: @mahogany_board, category: "manufacturer", price: 23.00, start_date: 24.months.ago.to_date)
      @mgh2_m = FactoryGirl.create(:item_price, item: @mahogany_board, category: "manufacturer", price: 25.95, start_date: 13.months.ago.to_date)
      @mgh3_m = FactoryGirl.create(:item_price, item: @mahogany_board, category: "manufacturer", price: 29.00, start_date: 180.days.ago.to_date)

      @map1_m = FactoryGirl.create(:item_price, item: @maple_board, category: "manufacturer", price: 39.95, start_date: 12.months.ago.to_date)
      @map2_m = FactoryGirl.create(:item_price, item: @maple_board, category: "manufacturer", price: 42.00, start_date: 6.months.ago.to_date)
      @map3_m = FactoryGirl.create(:item_price, item: @maple_board, category: "manufacturer", price: 44.95, start_date: 2.weeks.ago.to_date)
    end

    def create_board_prices_wholesale
      @vbg1_w = FactoryGirl.create(:item_price, item: @vinyl_green, price: 3.95, start_date: 24.months.ago.to_date)
      @vbg2_w = FactoryGirl.create(:item_price, item: @vinyl_green, price: 3.99, start_date: 14.months.ago.to_date)
      @vbg3_w = FactoryGirl.create(:item_price, item: @vinyl_green, price: 4.25, start_date: 6.months.ago.to_date)
      @vbg4_w = FactoryGirl.create(:item_price, item: @vinyl_green, price: 4.95, start_date: 4.weeks.ago.to_date)
      @vbg5_w = FactoryGirl.create(:item_price, item: @vinyl_green, price: 4.50, start_date: 2.weeks.ago.to_date)
      @vbg6_w = FactoryGirl.create(:item_price, item: @vinyl_green, price: 4.95, start_date: 1.weeks.ago.to_date)

      @vbb1_w = FactoryGirl.create(:item_price, item: @vinyl_blue, price: 3.95, start_date: 24.months.ago.to_date)
      @vbb2_w = FactoryGirl.create(:item_price, item: @vinyl_blue, price: 4.50, start_date: 14.months.ago.to_date)
      @vbb3_w = FactoryGirl.create(:item_price, item: @vinyl_blue, price: 4.95, start_date: 6.months.ago.to_date)
      @vbb4_w = FactoryGirl.create(:item_price, item: @vinyl_blue, price: 5.25, start_date: 4.weeks.ago.to_date)

      @vbr1_w = FactoryGirl.create(:item_price, item: @vinyl_red, price: 3.95, start_date: 24.months.ago.to_date)
      @vbr2_w = FactoryGirl.create(:item_price, item: @vinyl_red, price: 4.50, start_date: 14.months.ago.to_date)
      @vbr3_w = FactoryGirl.create(:item_price, item: @vinyl_red, price: 4.95, start_date: 6.months.ago.to_date)
      @vbr4_w = FactoryGirl.create(:item_price, item: @vinyl_red, price: 5.25, start_date: 4.weeks.ago.to_date)

      @vbk1_w = FactoryGirl.create(:item_price, item: @vinyl_black, price: 3.95, start_date: 24.months.ago.to_date)
      @vbk2_w = FactoryGirl.create(:item_price, item: @vinyl_black, price: 3.99, start_date: 14.months.ago.to_date)
      @vbk3_w = FactoryGirl.create(:item_price, item: @vinyl_black, price: 4.25, start_date: 6.months.ago.to_date)
      @vbk4_w = FactoryGirl.create(:item_price, item: @vinyl_black, price: 4.95, start_date: 4.weeks.ago.to_date)

      @mgh1_w = FactoryGirl.create(:item_price, item: @mahogany_board, price: 49.95, start_date: 24.months.ago.to_date)
      @mgh2_w = FactoryGirl.create(:item_price, item: @mahogany_board, price: 54.95, start_date: 13.months.ago.to_date)
      @mgh3_w = FactoryGirl.create(:item_price, item: @mahogany_board, price: 59.95, start_date: 180.days.ago.to_date)

      @map1_w = FactoryGirl.create(:item_price, item: @maple_board, price: 79.95, start_date: 12.months.ago.to_date)
      @map2_w = FactoryGirl.create(:item_price, item: @maple_board, price: 85.00, start_date: 6.months.ago.to_date)
      @map3_w = FactoryGirl.create(:item_price, item: @maple_board, price: 89.95, start_date: 2.weeks.ago.to_date)
    end

    def create_piece_prices_manufacturer
      @bcp1_m = FactoryGirl.create(:item_price, item: @basic_pieces, category: "manufacturer", price: 1.95, start_date: 24.months.ago.to_date)
      @bcp2_m = FactoryGirl.create(:item_price, item: @basic_pieces, category: "manufacturer", price: 2.25, start_date: 12.months.ago.to_date)
      @bcp3_m = FactoryGirl.create(:item_price, item: @basic_pieces, category: "manufacturer", price: 2.50, start_date: 6.months.ago.to_date)

      @wtp1_m = FactoryGirl.create(:item_price, item: @weighted_pieces, category: "manufacturer", price: 2.95, start_date: 24.months.ago.to_date)
      @wtp2_m = FactoryGirl.create(:item_price, item: @weighted_pieces, category: "manufacturer", price: 3.50, start_date: 12.months.ago.to_date)
      @wtp3_m = FactoryGirl.create(:item_price, item: @weighted_pieces, category: "manufacturer", price: 4.50, start_date: 6.months.ago.to_date)

      @wdp1_m = FactoryGirl.create(:item_price, item: @wooden_pieces, category: "manufacturer", price: 5.95, start_date: 24.months.ago.to_date)
      @wdp2_m = FactoryGirl.create(:item_price, item: @wooden_pieces, category: "manufacturer", price: 6.25, start_date: 12.months.ago.to_date)
      @wdp3_m = FactoryGirl.create(:item_price, item: @wooden_pieces, category: "manufacturer", price: 7.50, start_date: 6.months.ago.to_date)
    end

    def create_piece_prices_wholesale
      @bcp1_w = FactoryGirl.create(:item_price, item: @basic_pieces, price: 3.95, start_date: 24.months.ago.to_date)
      @bcp2_w = FactoryGirl.create(:item_price, item: @basic_pieces, price: 4.25, start_date: 12.months.ago.to_date)
      @bcp3_w = FactoryGirl.create(:item_price, item: @basic_pieces, price: 4.95, start_date: 6.months.ago.to_date)
      @bcp4_w = FactoryGirl.create(:item_price, item: @basic_pieces, price: 4.50, start_date: 2.weeks.ago.to_date)
      @bcp5_w = FactoryGirl.create(:item_price, item: @basic_pieces, price: 4.95, start_date: 1.weeks.ago.to_date)

      @wtp1_w = FactoryGirl.create(:item_price, item: @weighted_pieces, price: 6.95, start_date: 23.months.ago.to_date)
      @wtp2_w = FactoryGirl.create(:item_price, item: @weighted_pieces, price: 7.50, start_date: 11.months.ago.to_date)
      @wtp3_w = FactoryGirl.create(:item_price, item: @weighted_pieces, price: 8.95, start_date: 5.months.ago.to_date)

      @wdp1_w = FactoryGirl.create(:item_price, item: @wooden_pieces, price: 12.95, start_date: 22.months.ago.to_date)
      @wdp2_w = FactoryGirl.create(:item_price, item: @wooden_pieces, price: 14.95, start_date: 10.months.ago.to_date)
      @wdp3_w = FactoryGirl.create(:item_price, item: @wooden_pieces, price: 16.95, start_date: 4.months.ago.to_date)
    end

    def create_clock_prices_manufacturer
      @ana1_m = FactoryGirl.create(:item_price, item: @analog_clock, category: "manufacturer", price: 10.95, start_date: 24.months.ago.to_date)
      @zcr1_m = FactoryGirl.create(:item_price, item: @zmf_red_clock, category: "manufacturer", price: 21.95, start_date: 24.months.ago.to_date)
      @zcg1_m = FactoryGirl.create(:item_price, item: @zmf_green_clock, category: "manufacturer", price: 19.95, start_date: 24.months.ago.to_date)
      @chc1_m = FactoryGirl.create(:item_price, item: @chronos_clock, category: "manufacturer", price: 60.00, start_date: 24.months.ago.to_date)
    end

    def create_clock_prices_wholesale
      @ana1_w = FactoryGirl.create(:item_price, item: @analog_clock, price: 23.95, start_date: 24.months.ago.to_date)
      @zcr1_w = FactoryGirl.create(:item_price, item: @zmf_red_clock, price: 54.95, start_date: 24.months.ago.to_date)
      @zcg1_w = FactoryGirl.create(:item_price, item: @zmf_green_clock, price: 52.95, start_date: 24.months.ago.to_date)
      @chc1_w = FactoryGirl.create(:item_price, item: @chronos_clock, price: 124.95, start_date: 24.months.ago.to_date)
    end

    def create_supply_prices_manufacturer
      @cbg1_m = FactoryGirl.create(:item_price, item: @chess_bag_green, category: "manufacturer", price: 6.95, start_date: 24.months.ago.to_date)
      @cbb1_m = FactoryGirl.create(:item_price, item: @chess_bag_brown, category: "manufacturer", price: 6.95, start_date: 24.months.ago.to_date)
      @dem1_m = FactoryGirl.create(:item_price, item: @demo_board, category: "manufacturer", price: 19.95, start_date: 24.months.ago.to_date)
      @sbk1_m = FactoryGirl.create(:item_price, item: @scorebook, category: "manufacturer", price: 1.50, start_date: 24.months.ago.to_date)
    end

    def create_supply_prices_wholesale
      @cbg1_w = FactoryGirl.create(:item_price, item: @chess_bag_green, price: 14.95, start_date: 24.months.ago.to_date)
      @cbb1_w = FactoryGirl.create(:item_price, item: @chess_bag_brown, price: 14.95, start_date: 24.months.ago.to_date)
      @dem1_w = FactoryGirl.create(:item_price, item: @demo_board, price: 39.95, start_date: 24.months.ago.to_date)
      @sbk1_w = FactoryGirl.create(:item_price, item: @scorebook, price: 2.95, start_date: 24.months.ago.to_date)
    end

    def destroy_board_prices_manufacturer
      @vbg1_m.delete
      @vbg2_m.delete
      @vbg3_m.delete
      @vbg4_m.delete
      @vbb1_m.delete
      @vbb2_m.delete
      @vbb3_m.delete
      @vbb4_m.delete
      @vbr1_m.delete
      @vbr2_m.delete
      @vbr3_m.delete
      @vbr4_m.delete
      @vbk1_m.delete
      @vbk2_m.delete
      @vbk3_m.delete
      @vbk4_m.delete
      @mgh1_m.delete
      @mgh2_m.delete
      @mgh3_m.delete
      @map1_m.delete
      @map2_m.delete
      @map3_m.delete
    end

    def destroy_board_prices_wholesale
      @vbg1_w.delete
      @vbg2_w.delete
      @vbg3_w.delete
      @vbg4_w.delete
      @vbg5_w.delete
      @vbg6_w.delete
      @vbb1_w.delete
      @vbb2_w.delete
      @vbb3_w.delete
      @vbb4_w.delete
      @vbr1_w.delete
      @vbr2_w.delete
      @vbr3_w.delete
      @vbr4_w.delete
      @vbk1_w.delete
      @vbk2_w.delete
      @vbk3_w.delete
      @vbk4_w.delete
      @mgh1_w.delete
      @mgh2_w.delete
      @mgh3_w.delete
      @map1_w.delete
      @map2_w.delete
      @map3_w.delete
    end

    def destroy_piece_prices_manufacturer
      @bcp1_m.delete
      @bcp2_m.delete
      @bcp3_m.delete
      @wtp1_m.delete
      @wtp2_m.delete
      @wtp3_m.delete
      @wdp1_m.delete
      @wdp2_m.delete
      @wdp3_m.delete
    end

    def destroy_piece_prices_wholesale
      @bcp1_w.delete
      @bcp2_w.delete
      @bcp3_w.delete
      @bcp4_w.delete
      @bcp5_w.delete
      @wtp1_w.delete
      @wtp2_w.delete
      @wtp3_w.delete
      @wdp1_w.delete
      @wdp2_w.delete
      @wdp3_w.delete
    end

    def destroy_clock_prices_manufacturer
      @ana1_m.delete
      @zcr1_m.delete
      @zcg1_m.delete
      @chc1_m.delete
    end

    def destroy_clock_prices_wholesale
      @ana1_w.delete
      @zcr1_w.delete
      @zcg1_w.delete
      @chc1_w.delete
    end

    def destroy_supply_prices_manufacturer
      @cbg1_m.delete
      @cbb1_m.delete
      @dem1_m.delete
      @sbk1_m.delete
    end

    def destroy_supply_prices_wholesale
      @cbg1_w.delete
      @cbb1_w.delete
      @dem1_w.delete
      @sbk1_w.delete
    end
  end
end