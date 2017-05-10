class OrdersController < ApplicationController
	include ChessStoreHelpers::Cart
	include ChessStoreHelpers::Shipping
	helper ItemsHelper
	before_action :check_login
	authorize_resource

	def new
	end

	def create
	end

	def show
		
	end

	def index
		@orders = Order.all.chronological
	end

	# current user
	def list
		@orders = Order.where(user: current_user).chronological
	end

	def unshipped
		@orders = Order.chronological.to_a.select! { |o| (o.order_items.map { |oi| oi.shipped_on }).include?(nil) }
	end

	# show cart
	def cart
		@order_items = get_list_of_items_in_cart
		@order_items_cost = calculate_cart_items_cost
		@shipping_cost = calculate_cart_shipping
	end

	def empty
		clear_cart

		respond_to do |format|
			format.js
		end
	end

	def add
		@quantity = Integer(params[:quantity])
		@item = Item.find_by_id(params[:item_id])
		current_price = @item.current_price
		@total_cost = current_price * @quantity
		puts @quantity, @quantity.class
		@quantity.times do
			puts "one time"
			add_item_to_cart(params[:item_id])
		end
		@order_items = get_list_of_items_in_cart
		respond_to do |format|
			format.js
		end
	end

	def update
		@item_id = params[:item_id]
		
		@quantity = Integer(params[:quantity])

		if @quantity > 0
			remove_item_from_cart(@item_id)
			# redo quantity
			@quantity.times do
				add_item_to_cart(@item_id)
			end
		end

		@order_items = get_list_of_items_in_cart
	end

	def remove
		@item_id = params[:item_id]

		remove_item_from_cart(params[:item_id])

		respond_to do |format|
			format.js
		end
	end

	def checkout
		if get_list_of_items_in_cart.length == 0
			redirect_to cart_path, alert: "You have nothing to buy."
		end
		@order = Order.new
	end

	def place
		@order = Order.new(order_params)

		@order.expiration_year = Integer(@order.expiration_year)
		@order.expiration_month = Integer(@order.expiration_month)
		@order.school_id = Integer(@order.school_id)

		@order.grand_total = calculate_cart_items_cost + calculate_cart_shipping

		@order.user = current_user
		if @order.save
			save_each_item_in_cart(@order)
			clear_cart
			redirect_to orders_list_path, notice: "Successfully placed your order."
		else
			render action: 'checkout'
		end
	end

	def cancel
		@order = Order.find_by_id(params[:order_id])
		@order.destroy
		respond_to do |format|
			format.js
		end
	end

	private
	def get_cancellable(order)
		unless order.user_id == current_user.id || current_user.role == 'admin'
			return false
		end
		
		for oi in order.order_items
			if oi.shipped_on != nil
				return false
			end
		end
		return true
	end
	helper_method :get_cancellable

	def cart_subtotal
		sprintf("$%.2f", calculate_cart_items_cost)
	end
	helper_method :cart_subtotal

	def cart_shipping
		sprintf("$%.2f", calculate_cart_shipping)
	end
	helper_method :cart_shipping

	def cart_total
		sprintf("$%.2f", calculate_cart_items_cost + calculate_cart_shipping)
	end
	helper_method :cart_total

	def order_params
		params.require(:order).permit(:user, :school_id, :credit_card_number, :expiration_year, :expiration_month)
	end
end