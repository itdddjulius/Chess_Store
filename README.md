# 67272 A&M Chess Store Project
===

This is the repository of my solution for Phase 5 of the [67-272 Chess Store Project](http://67272.cmuis.net/projects). The project was designed and built from the ground up by me.

**The app is hosted on a free on Heroku [here](https://gentle-brushlands-60542.herokuapp.com/). The app may take up to a minute to wake up and load on the first visit.**

### Prerequisites
Make sure to have Ruby and Rails installed

### Installing
You will need to run `bundle install` to get the needed gems. You may populate the development database with realistic data by running `rake db:populate` if needed. Populating will drop the database and recreate it, and will likely result in information loss. 

All passwords are 'secret' in the system for all users. The list of known users include (email, role): 

- admin@example.com (admin)
- shipper@example.com (shipper)
- manager@example.com (manager)
- customer@example.com (customer)

*These accounts will be lost if the database if repopulated. If lost, they can be recovered with the dump file in the main directory*

## Built With

* [Ruby on Rails](http://rubyonrails.org/) - The web framework used
* [Maven](http://foundation.zurb.com/) - CSS Framework used for Grid System
