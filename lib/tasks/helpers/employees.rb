module Populator
  module Employees
    def create_employees
      @alex     = FactoryGirl.create(:user, first_name: "Alex", last_name: "Heimann", username: "tank", role: "admin")
      @mark     = FactoryGirl.create(:user, first_name: "Mark", last_name: "Heimann", username: "mark", role: "admin", phone: "412-268-8211")
      @manager1 = FactoryGirl.create(:user, first_name: "Rick", last_name: "Huang", username: "rhuang", role: "manager")
      @shipper1 = FactoryGirl.create(:user, first_name: "Connor", last_name: "Hanley", username: "chanley", role: "shipper")
      @manager2 = FactoryGirl.create(:user, first_name: "Becca", last_name: "Kern", username: "bkern", role: "manager")
      @shipper2 = FactoryGirl.create(:user, first_name: "Sarah", last_name: "Reyes-Franco", username: "srf", role: "shipper")
    end
  end
end