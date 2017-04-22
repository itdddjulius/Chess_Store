module Populator
  module Clocks
    def create_clocks_and_prices
      analog_clock = FactoryGirl.create(:item, 
        name: "Basic Analog Chess Clock", 
        description: "This Basic Chess Clock is an easy to use analog clock in an attractive black plastic case. Just wind up the movement, set the hands and you are ready to go. This chess clock is ideal for schools & clubs or for anyone who wants the simplicity of an analog chess clock.", 
        color: "black", 
        category: "clocks", 
        weight: 0.9)
      
      zmf_red_clock = FactoryGirl.create(:item, 
        name: "ZMF-II Digital Chess Timer Red", 
        description: "The ZMF-II has modern, bright LED display technology, stainless steel, accurate, touch sense buttons, and a red durable plastic case made here in the USA. The ZMF-II has fewer features than the Chronos, but most everything you will need. Chronos has a metal case. ZMF-II is plastic. However at half the price you can buy two for the price of a Chronos.", 
        color: "red", 
        category: "clocks", 
        inventory_level: Populator::QUANTITIES.sample,
        weight: 1.0)
      
      zmf_green_clock = FactoryGirl.create(:item, 
        name: "ZMF-II Digital Chess Timer Green", 
        description: "The ZMF-II has modern, bright LED display technology, stainless steel, accurate, touch sense buttons, and durable plastic case made here in the USA. The ZMF-II has fewer features than the Chronos, but most everything you will need. Chronos has a metal case. ZMF-II is plastic. However at half the price you can buy two for the price of a Chronos.", 
        color: "green/black", 
        category: "clocks", 
        inventory_level: Populator::QUANTITIES.sample,
        weight: 1.0)
      
      chronos_clock = FactoryGirl.create(:item, 
        name: "Chronos Chess Clock", 
        description: "Our best chess clock, the Chronos Digital Chess Clock has two 2 LCD screens in a metal casing with touch sensors so that you don't push the button down; it just senses the slightest brush of your finger. It has 4 preset blitz times, 8 preset tournament controls, move counter, a new GO! time setting, and many other adjustments. It is also fully customizable and can have any delay or increment time as well--perfect for chess tournaments.", 
        color: "beige", 
        category: "clocks", 
        inventory_level: Populator::QUANTITIES.sample,
        weight: 1.2)
        
      ana1_m = FactoryGirl.create(:item_price, category: 'manufacturer', item: analog_clock, price: 10.95, start_date: 24.months.ago.to_date)
      zcr1_m = FactoryGirl.create(:item_price, category: 'manufacturer', item: zmf_red_clock, price: 21.95, start_date: 24.months.ago.to_date)
      zcg1_m = FactoryGirl.create(:item_price, category: 'manufacturer', item: zmf_green_clock, price: 19.95, start_date: 24.months.ago.to_date)
      chc1_m = FactoryGirl.create(:item_price, category: 'manufacturer', item: chronos_clock, price: 60.00, start_date: 24.months.ago.to_date)
      
      ana1_w = FactoryGirl.create(:item_price, category: 'wholesale', item: analog_clock, price: 14.95, start_date: 24.months.ago.to_date)
      zcr1_w = FactoryGirl.create(:item_price, category: 'wholesale', item: zmf_red_clock, price: 39.95, start_date: 24.months.ago.to_date)
      zcg1_w = FactoryGirl.create(:item_price, category: 'wholesale', item: zmf_green_clock, price: 34.95, start_date: 24.months.ago.to_date)
      chc1_w = FactoryGirl.create(:item_price, category: 'wholesale', item: chronos_clock, price: 99.95, start_date: 24.months.ago.to_date)
      
    end
    
  end
end