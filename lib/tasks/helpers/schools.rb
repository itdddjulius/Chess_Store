module Populator
  module Schools
    
    require 'faker'
    
    def create_schools
      @cent_cath = FactoryGirl.create(:school)
      @ingomar   = FactoryGirl.create(:school, name: "Ingomar Middle School", street_1: "1521 Ingomar Heights Rd", zip: "15237", min_grade: 6, max_grade: 8)
      @fairview  = FactoryGirl.create(:school, name: "Fairview Elementary School", street_1: "738 Dorseyville Rd", zip: "15238", min_grade: 0, max_grade: 5)
      @peebles   = FactoryGirl.create(:school, name: "Peebles Elementary School", street_1: "8625 Peebles Rd", zip: "15237", min_grade: 0, max_grade: 5)
      @oliver    = FactoryGirl.create(:school, name: "Oliver High School", street_1: "2323 Brighton Rd", zip: "15212")
      
      40.times do |i|
        city = Faker::Address.city
        street = Faker::Address.street_address
        state = School::STATES_LIST.to_h.values.sample
        zip = (1001..99999).to_a.sample.to_s.rjust(5,'0')
        if i%2 == 0
          FactoryGirl.create(:school, name: "#{city} Elementary School", street_1: "#{street}", city: "#{city}", state: "#{state}", zip: "#{zip}", min_grade: 0, max_grade: [5,6].sample)
        else
          FactoryGirl.create(:school, name: "#{city} High School", street_1: "#{street}", city: "#{city}", state: "#{state}", zip: "#{zip}")
        end
      end
    end
  end
end