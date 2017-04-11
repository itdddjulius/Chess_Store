module Populator
  module Customers
    
    require 'faker'
    
    def create_customers
      @karen   = FactoryGirl.create(:user, first_name: "Karen", last_name: "Irvine", username: "kirvine")
      @markv   = FactoryGirl.create(:user, first_name: "Mark", last_name: "Vella", username: "mvella")
      @israel  = FactoryGirl.create(:user, first_name: "Israel", last_name: "Madueme", username: "imadueme", phone: "412-268-2323")
      @ben     = FactoryGirl.create(:user, first_name: "Ben", last_name: "Junker", username: "bjunker")
      @melanie = FactoryGirl.create(:user, first_name: "Melanie", last_name: "Freeman", username: "melfree")

      40.times do |i|
        fn = Faker::Name.first_name
        ln = Faker::Name.last_name
        FactoryGirl.create(:user, first_name: "#{fn}", last_name: "#{ln}")
      end
    end
  end
end