module Contexts
  module Items
    # Context for items (assumes no prior contexts)
    def create_items
      create_boards
      create_pieces
      create_clocks
      create_supplies
    end
    
    def destroy_items
      destroy_boards
      destroy_pieces
      destroy_clocks
      destroy_supplies
    end

    def create_boards
      @vinyl_green = FactoryGirl.create(:item)
      @vinyl_blue  = FactoryGirl.create(:item, 
        name: "Vinyl Chess Board - Blue & White", 
        color: "blue/white")
      @vinyl_black = FactoryGirl.create(:item, 
        name: "Vinyl Chess Board - Black & White", 
        color: "black/white")
      @vinyl_red   = FactoryGirl.create(:item, 
        name: "Vinyl Chess Board - Red & White", 
        color: "red/white")

      @mahogany_board = FactoryGirl.create(:item, 
        name: "Mahogany Wood Chess Board", 
        description: "This attractive and affordable chess board features a classic 1-1/2 inch mahogany border. The squares are 2-1/8 inch and the board is 1/2 inch thick. It is made in Poland of quality manufacturing with alternating Mahogany squares.", 
        color: "brown/tan",
        weight: 2.1)

      @maple_board    = FactoryGirl.create(:item, 
        name: "Maple Wood Chess Board", 
        description: "This board is composed of alternating 2 1/4 inch maple and walnut squares. It has a beautiful, unique 2 inch maple border with walnut trim around the playing surface for the perfect contrast. It makes an elegant companion to chess pieces with a king base of 1 3/8 inch to 1 3/4 inch (3-3/4 inch king height).  The board is backed with felt so it will not scratch the surface where it sits. It will look great with pieces featuring light or natural wooden tones.", 
        color: "brown/tan",
        weight: 2.2)

      @rosewood_board  = FactoryGirl.create(:item, 
        name: "Rosewood Chess Board", 
        description: "This beautiful wood chess board is made of maple and rosewood with a very distinct and luxurious grain. The board has a narrow black accent separating the border from the squares, and the rosewood border features a black beveled edge. It makes an outstanding board for chess pieces with a king height of 3 3/4 inches. The board is backed with felt so it will not scratch the surface where it sits.", 
        weight: 2.25,
        color: "brown/tan",
        active: false)
    end

    def create_pieces
      @basic_pieces = FactoryGirl.create(:item, 
        name: "Basic Chess Pieces", 
        description: "The Basic Chess Pieces are our least expensive pieces and are ideal for schools and clubs working on a tight budget. These chess sets meet all chess tournament standards and regulations. They are a standard Staunton design and have a 3 3/4 inch tall King with a 1 1/2 inch felt paper base.", 
        color: "black/white", 
        category: "pieces", 
        weight: 0.85)

      @weighted_pieces = FactoryGirl.create(:item, 
        name: "Weighted Chess Pieces", 
        description: "Our Weighted Tournament Chess Pieces are just that - heavy! The entire set weighs in at just over 2 pounds and has a nice weighted feel. The pieces are easy to play with and their weight makes them perfect for tournaments or blitz play. With a King of 3 3/4 inch tall and a 1 1/2 inch base, these pieces meet all tournament regulations. The set includes extra queens as well.", 
        color: "black/white", 
        category: "pieces", 
        weight: 2.2)

      @zagreb_pieces = FactoryGirl.create(:item, 
        name: "Zagreb Chess Pieces", 
        description: "This is a beautiful reproduction of Zagreb Chess Set used at major international chess tournaments. The queens and bishops have a contrasting color ball on top and the king has a contrasting crown. The knight is a most interesting piece. Patterned after a Russian knight, he has his head down, a closed mouth, a dramatically carved head, and thin curved neck above his thick chest.  As with all wood pieces, sets many have variations in colors of grain within a set.  These pieces are weighted.", 
        color: "brown/tan", 
        category: "pieces", 
        weight: 2.25,
        active: false)

      @wooden_pieces = FactoryGirl.create(:item, 
        name: "Wooden Chess Pieces", 
        description: "These beautiful wooden chess pieces are a great addition to any chess pieces collection or entry-level wood chess sets. The pieces are specifically designed to offer a solid, durable style that can stand up to abuse without breaking. They are designed with a simple but traditional style and are available in two wood finishes for the dark pieces. Light pieces are made from light boxwood, and dark pieces are made from sheesham. Each set features a full 32 pieces. These pieces are lightly weighted.", 
        color: "brown/tan", 
        category: "pieces", 
        weight: 2.0)

    end

    def create_clocks
      @analog_clock = FactoryGirl.create(:item, 
        name: "Basic Analog Chess Clock", 
        description: "This Basic Chess Clock is an easy to use analog clock in an attractive black plastic case. Just wind up the movement, set the hands and you are ready to go. This chess clock is ideal for schools & clubs or for anyone who wants the simplicity of an analog chess clock.", 
        color: "black", 
        category: "clocks", 
        weight: 0.9)

      @zmf_red_clock = FactoryGirl.create(:item, 
        name: "ZMF-II Digital Chess Timer Red", 
        description: "The ZMF-II has modern, bright LED display technology, stainless steel, accurate, touch sense buttons, and a red durable plastic case made here in the USA. The ZMF-II has fewer features than the Chronos, but most everything you will need. Chronos has a metal case. ZMF-II is plastic. However at half the price you can buy two for the price of a Chronos.", 
        color: "red", 
        category: "clocks", 
        weight: 1.0)

      @zmf_green_clock = FactoryGirl.create(:item, 
        name: "ZMF-II Digital Chess Timer Green", 
        description: "The ZMF-II has modern, bright LED display technology, stainless steel, accurate, touch sense buttons, and durable plastic case made here in the USA. The ZMF-II has fewer features than the Chronos, but most everything you will need. Chronos has a metal case. ZMF-II is plastic. However at half the price you can buy two for the price of a Chronos.", 
        color: "green/black", 
        category: "clocks", 
        weight: 1.0)

      @chronos_clock = FactoryGirl.create(:item, 
        name: "Chronos Chess Clock", 
        description: "Our best chess clock, the Chronos Digital Chess Clock has two 2 LCD screens in a metal casing with touch sensors so that you don't push the button down; it just senses the slightest brush of your finger. It has 4 preset blitz times, 8 preset tournament controls, move counter, a new GO! time setting, and many other adjustments. It is also fully customizable and can have any delay or increment time as well--perfect for chess tournaments.", 
        color: "beige", 
        category: "clocks", 
        weight: 1.2)
    end

    def create_supplies
      @chess_bag_green = FactoryGirl.create(:item, 
        name: "Carry-All Tournament Chess Set Bag Green", 
        description: "The Carryall Tournament Chess Bags are the perfect answer for storing and carrying all of your chess equipment. Each 24 inch x 7 inch chess bag is made of durable nylon canvas and will hold a rolled-up chess board, a full set of chess pieces, and most chess clocks.", 
        color: "green", 
        category: "supplies", 
        weight: 0.3)

      @chess_bag_brown = FactoryGirl.create(:item, 
        name: "Carry-All Tournament Chess Set Bag Brown", 
        description: "The Carryall Tournament Chess Bags are the perfect answer for storing and carrying all of your chess equipment. Each 24 inch x 7 inch chess bag is made of durable nylon canvas and will hold a rolled-up chess board, a full set of chess pieces, and most chess clocks.", 
        color: "brown", 
        category: "supplies", 
        weight: 0.3)

      @demo_board = FactoryGirl.create(:item, 
        name: "Chess Demo Board and Pieces", 
        description: "Our Chess Demo Board with Clear Pieces & Bag is our most up-to-date, as well as our largest chess demo board. It is a huge 36 inch size with 4 inch squares so you can use this board to teach large groups of students easily.", 
        color: "green/white", 
        category: "supplies", 
        weight: 2.0)

      @scorebook = FactoryGirl.create(:item, 
        name: "Softcover Quality Scorebook", 
        description: "Each scorebook holds 50 chess games and is spiral bound for easy access to your games and so you won't lose them. They also have a cardstock cover and back page for durability and protection. Each page holds 100 moves per sheet and has a blank diagram for special or adjourned positions.", 
        color: "orange", 
        category: "supplies", 
        weight: 0.25)
    end

    def destroy_boards
      @vinyl_green.delete
      @vinyl_blue.delete
      @vinyl_black.delete
      @vinyl_red.delete
      @mahogany_board.delete
      @maple_board.delete
      @rosewood_board.delete
    end

    def destroy_pieces
      @basic_pieces.delete
      @weighted_pieces.delete
      @wooden_pieces.delete
      @zagreb_pieces.delete
    end

    def destroy_clocks
      @analog_clock.delete
      @zmf_red_clock.delete
      @zmf_green_clock.delete
      @chronos_clock.delete
    end

    def destroy_supplies
      @chess_bag_green.delete
      @chess_bag_brown.delete
      @demo_board.delete
      @scorebook.delete
    end

  end
end