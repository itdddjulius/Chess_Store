class OrderItemsController < ApplicationController
	def ship_item
		@order_item = OrderItem.find_by_id(params[:order_item_id])
		if @order_item.shipped_on == nil
			@order_item.shipped
		end
		respond_to do |format|
			format.js
		end
	end
end