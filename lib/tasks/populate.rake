namespace :db do
  desc "Erase and fill database"
  # creating a rake task within db namespace called 'populate'
  # executing 'rake db:populate' will cause this script to run
  task :populate => :environment do
    require 'factory_girl_rails'
    require 'populator'
    include Populator
    
    # Step 0: drop old databases and rebuild
    Rake::Task['db:drop'].invoke
    Rake::Task['db:create'].invoke
    Rake::Task['db:migrate'].invoke
    Rake::Task['db:test:prepare'].invoke

    # Step 1: create pieces along with purchases and prices
    create_pieces_and_prices
    
    # Step 2: create boards along with purchases and prices
    create_boards_and_prices

    # Step 3: create clocks and prices   
    create_clocks_and_prices

    # Step 4: create supplies along with purchases and prices
    create_supplies_and_prices
    
    # Step 5: create schools
    create_schools
    
    # Step 6: create customers
    create_customers
    
    # Step 7: create employees
    create_employees
    
    # Step 8: create orders (just boards and pieces) for 5 known customers (3-5 orders each) and 20 other customers (1 order each, 5 of which are unshipped)
    create_orders

  end
end