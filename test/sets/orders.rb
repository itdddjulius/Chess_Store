module Contexts
  module Orders
    # Context for orders (assumes users, schools contexts)
    def create_orders
      @karen_o1 = FactoryGirl.create(:order, user: @karen, school: @fairview, grand_total: 94.95, date: 5.months.ago.to_date)
      @karen_o1.pay
      @karen_o2 = FactoryGirl.create(:order, user: @karen, school: @fairview, grand_total: 79.75, date: 3.weeks.ago.to_date)
      @karen_o2.pay
      @karen_o3 = FactoryGirl.create(:order, user: @karen, school: @fairview, grand_total: 54.50, payment_receipt: nil, date: Date.current)
      @markv_o1 = FactoryGirl.create(:order, user: @markv, school: @ingomar, grand_total: 43.90, date: 4.weeks.ago.to_date)
      @markv_o1.pay
      @markv_o2 = FactoryGirl.create(:order, user: @markv, school: @ingomar, grand_total: 32.50, payment_receipt: nil, date: Date.current)
      @ben_o1   = FactoryGirl.create(:order, user: @ben, school: @cent_cath, grand_total: 388.50, date: 2.weeks.ago.to_date)
      @ben_o1.pay
    end
    
    def destroy_orders
      @karen_o1.delete 
      @karen_o2.delete
      @karen_o3.delete
      @markv_o1.delete
      @markv_o2.delete
      @ben_o1.delete
    end

  end
end