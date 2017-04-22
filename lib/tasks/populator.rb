# require needed files
require './lib/tasks/helpers/pieces'
require './lib/tasks/helpers/boards'
require './lib/tasks/helpers/clocks'
require './lib/tasks/helpers/supplies'
require './lib/tasks/helpers/employees'
require './lib/tasks/helpers/customers'
require './lib/tasks/helpers/schools'
require './lib/tasks/helpers/orders'


module Populator
  QUANTITIES = [10,20,25,30,40,50,100].freeze
  PRICE_INCREMENTS = [0.15,0.15,0.2,0.2,0.25,0.25,0.3,0.4].freeze
  MARKUPS = [1.50, 1.75, 1.85, 1.95].freeze
  
  include Populator::Pieces
  include Populator::Boards
  include Populator::Clocks
  include Populator::Supplies
  include Populator::Employees
  include Populator::Customers
  include Populator::Schools
  include Populator::Orders
end
