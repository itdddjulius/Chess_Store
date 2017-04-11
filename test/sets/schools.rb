module Contexts
  module Schools
    # Context for schools
    def create_schools
      @cent_cath = FactoryGirl.create(:school)
      @ingomar   = FactoryGirl.create(:school, name: "Ingomar Middle School", street_1: "1521 Ingomar Heights Rd", zip: "15237", min_grade: 6, max_grade: 8)
      @fairview  = FactoryGirl.create(:school, name: "Fairview Elementary School", street_1: "738 Dorseyville Rd", zip: "15238", min_grade: 0, max_grade: 5)
      @peebles   = FactoryGirl.create(:school, name: "Peebles Elementary School", street_1: "8625 Peebles Rd", zip: "15237", min_grade: 0, max_grade: 5)
      @oliver    = FactoryGirl.create(:school, name: "Oliver High School", street_1: "2323 Brighton Rd", zip: "15212", active: false)
    end
    
    def destroy_schools
      @cent_cath.delete
      @ingomar.delete
      @fairview.delete
      @peebles.delete
      @oliver.delete
    end

  end
end