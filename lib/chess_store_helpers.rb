# require needed files
require 'helpers/validations'
require 'helpers/cart'
require 'helpers/shipping'

# create BreadExpressHelpers
module ChessStoreHelpers
  include ChessStoreHelpers::Validations
  include ChessStoreHelpers::Shipping
  include ChessStoreHelpers::Cart
end