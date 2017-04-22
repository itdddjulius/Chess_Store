module Populator
  module Orders
    def create_orders
      create_orders_for_known_customers_and_schools
      create_orders_for_other_customers_and_schools
    end
    
    def create_orders_for_known_customers_and_schools
      b0 = Item.find(11)
      b1 = Item.find(15)
      p0 = Item.find(4)
      p1 = Item.find(5)
      (1..5).each do |i|
        num_of_orders = [3,4,5].sample
        customer = User.find(i)
        school = School.find(i)
        num_of_orders.times do |t|
          num_of_sets = [2,3,4,5,5,5,5,6].sample
          starting = case num_of_orders
            when 3 then [435,430,425].sample
            when 4 then [580,575,570,565].sample
            else [725,720,715,710,705].sample
          end
          order_day = starting - t*140
          ship_day = order_day - [1,2,3].sample
          order = FactoryGirl.create(:order, user: customer, school: school, grand_total: 94.95, date: order_day.days.ago.to_date)
          if rand(3) == 0
            FactoryGirl.create(:order_item, order: order, item: p0, quantity: num_of_sets, shipped_on: ship_day.days.ago.to_date)
            FactoryGirl.create(:order_item, order: order, item: b0, quantity: num_of_sets, shipped_on: ship_day.days.ago.to_date)
          else
            FactoryGirl.create(:order_item, order: order, item: p1, quantity: num_of_sets, shipped_on: ship_day.days.ago.to_date)
            FactoryGirl.create(:order_item, order: order, item: b1, quantity: num_of_sets, shipped_on: ship_day.days.ago.to_date)
          end
          order.grand_total = order.order_items.map{|oi| oi.subtotal(order_day.days.ago.to_date)}.inject(0){|sum,sub| sum += sub} + order.shipping_costs
          order.save
        end
      end
      
      def create_orders_for_other_customers_and_schools
        b0 = Item.find(11)
        p0 = Item.find(4)
        15.times do
          random_id = (6..45).to_a.sample
          customer = User.find(random_id)
          school = School.find(random_id)
          num_of_sets = [2,3,4,5].sample
          order_day = (5..650).to_a.sample
          ship_day = order_day - [1,2,3].sample
          order = FactoryGirl.create(:order, user: customer, school: school, grand_total: 94.95, date: order_day.days.ago.to_date)
          FactoryGirl.create(:order_item, order: order, item: p0, quantity: num_of_sets, shipped_on: ship_day.days.ago.to_date)
          FactoryGirl.create(:order_item, order: order, item: b0, quantity: num_of_sets, shipped_on: ship_day.days.ago.to_date)
          order.grand_total = order.order_items.map{|oi| oi.subtotal(order_day.days.ago.to_date)}.inject(0){|sum,sub| sum += sub} + order.shipping_costs
          order.save
        end
        5.times do
          random_id = (6..45).to_a.sample
          customer = User.find(random_id)
          school = School.find(random_id)
          num_of_sets = [2,3,4,5].sample
          order_day = [Date.today, 1.day.ago.to_date].sample
          order = FactoryGirl.create(:order, user: customer, school: school, grand_total: 94.95, date: order_day)
          FactoryGirl.create(:order_item, order: order, item: p0, quantity: num_of_sets, shipped_on: nil)
          FactoryGirl.create(:order_item, order: order, item: b0, quantity: num_of_sets, shipped_on: nil)
          order.grand_total = order.order_items.map{|oi| oi.subtotal(order_day)}.inject(0){|sum,sub| sum += sub} + order.shipping_costs
          order.save
        end
      end
      
      def update_order_total(order)
        order.grand_total = order.order_items.map{|oi| oi.subtotal(order_day.days.ago.to_date)}.inject(0){|sum,sub| sum += sub} + order.shipping_costs
        order.save        
      end
      
    end
  end
end