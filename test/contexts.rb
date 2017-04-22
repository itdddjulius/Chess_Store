# require needed files
require './test/sets/items'
require './test/sets/item_prices'
require './test/sets/orders'
require './test/sets/order_items'
require './test/sets/schools'
require './test/sets/purchases'
require './test/sets/users'
require './test/sets/credit_cards'

module Contexts
  # explicitly include all sets of contexts used for testing 
  include Contexts::Items
  include Contexts::ItemPrices
  include Contexts::Orders
  include Contexts::OrderItems
  include Contexts::Schools
  include Contexts::Purchases
  include Contexts::Users
  include Contexts::CreditCards
end