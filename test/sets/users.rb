module Contexts
  module Users
    # Context for both customer and employee users
    def create_customer_users
      @karen   = FactoryGirl.create(:user, first_name: "Karen", last_name: "Irvine", username: "kirvine")
      @markv   = FactoryGirl.create(:user, first_name: "Mark", last_name: "Vella", username: "mvella")
      @israel  = FactoryGirl.create(:user, first_name: "Israel", last_name: "Madueme", username: "imadueme", phone: "412-268-2323")
      @ben     = FactoryGirl.create(:user, first_name: "Ben", last_name: "Junker", username: "bjunker")
      @melanie = FactoryGirl.create(:user, first_name: "Melanie", last_name: "Freeman", username: "melfree", active: false)
    end
    
    def destroy_customer_users
      @karen.delete
      @markv.delete
      @israel.delete
      @ben.delete 
      @melanie.delete
    end

    def create_employee_users
      @alex        = FactoryGirl.create(:user, first_name: "Alex", last_name: "Heimann", username: "tank", role: "admin")
      @mark        = FactoryGirl.create(:user, first_name: "Mark", last_name: "Heimann", username: "mark", role: "admin", phone: "412-268-8211")
      @manager     = FactoryGirl.create(:user, first_name: "Inventory", last_name: "Manager", username: "inventory", role: "manager")
      @shipper     = FactoryGirl.create(:user, first_name: "Young", last_name: "Shipper", username: "shipper", role: "shipper")
      @old_shipper = FactoryGirl.create(:user, first_name: "Old", last_name: "Shipper", username: "old_shipper", role: "shipper", active: false)
    end

    def destroy_employee_users
      @alex.delete
      @mark.delete
      @manager.delete
      @shipper.delete
      @old_shipper.delete
    end

  end
end