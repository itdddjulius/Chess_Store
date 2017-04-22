module Populator
  module Supplies
    def create_supplies_and_prices
      chess_bag_green = FactoryGirl.create(:item, 
        name: "Carry-All Tournament Chess Set Bag Green", 
        description: "The Carryall Tournament Chess Bags are the perfect answer for storing and carrying all of your chess equipment. Each 24 inch x 7 inch chess bag is made of durable nylon canvas and will hold a rolled-up chess board, a full set of chess pieces, and most chess clocks.", 
        color: "green", 
        category: "supplies", 
        inventory_level: Populator::QUANTITIES.sample,
        weight: 0.3)
    
      chess_bag_brown = FactoryGirl.create(:item, 
        name: "Carry-All Tournament Chess Set Bag Brown", 
        description: "The Carryall Tournament Chess Bags are the perfect answer for storing and carrying all of your chess equipment. Each 24 inch x 7 inch chess bag is made of durable nylon canvas and will hold a rolled-up chess board, a full set of chess pieces, and most chess clocks.", 
        color: "brown", 
        category: "supplies", 
        inventory_level: Populator::QUANTITIES.sample,
        weight: 0.3)
    
      demo_board = FactoryGirl.create(:item, 
        name: "Chess Demo Board and Pieces", 
        description: "Our Chess Demo Board with Clear Pieces & Bag is our most up-to-date, as well as our largest chess demo board. It is a huge 36 inch size with 4 inch squares so you can use this board to teach large groups of students easily.", 
        color: "green/white", 
        category: "supplies", 
        inventory_level: Populator::QUANTITIES.sample,
        weight: 2.0)
    
      scorebook = FactoryGirl.create(:item, 
        name: "Softcover Quality Scorebook", 
        description: "Each scorebook holds 50 chess games and is spiral bound for easy access to your games and so you won't lose them. They also have a cardstock cover and back page for durability and protection. Each page holds 100 moves per sheet and has a blank diagram for special or adjourned positions.", 
        color: "orange", 
        category: "supplies", 
        weight: 0.25)
    
      cbg1_m = FactoryGirl.create(:item_price, category: 'manufacturer', item: chess_bag_green, price: 6.95, start_date: 24.months.ago.to_date)
      cbb1_m = FactoryGirl.create(:item_price, category: 'manufacturer', item: chess_bag_brown, price: 6.95, start_date: 24.months.ago.to_date)
      dem1_m = FactoryGirl.create(:item_price, category: 'manufacturer', item: demo_board, price: 19.95, start_date: 24.months.ago.to_date)
      sbk1_m = FactoryGirl.create(:item_price, category: 'manufacturer', item: scorebook, price: 1.50, start_date: 24.months.ago.to_date)
      
      cbg1_w = FactoryGirl.create(:item_price, category: 'wholesale', item: chess_bag_green, price: 6.95, start_date: 24.months.ago.to_date)
      cbb1_w = FactoryGirl.create(:item_price, category: 'wholesale', item: chess_bag_brown, price: 6.95, start_date: 24.months.ago.to_date)
      dem1_w = FactoryGirl.create(:item_price, category: 'wholesale', item: demo_board, price: 19.95, start_date: 24.months.ago.to_date)
      sbk1_w = FactoryGirl.create(:item_price, category: 'wholesale', item: scorebook, price: 1.50, start_date: 24.months.ago.to_date)
      
      p_scorebook = FactoryGirl.create(:purchase, item: scorebook, quantity: -80, date: Date.yesterday)
      
    end
    
  end
end