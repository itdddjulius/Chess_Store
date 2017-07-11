class HomeController < ApplicationController
	

	def home
		@items_to_reorder = Item.need_reorder.alphabetical.to_a
		@orders = Order.chronological.to_a.select! { |o| (o.order_items.map { |oi| oi.shipped_on }).include?(nil) }
		# @popular_items = 
		# @discounted_items = 
		# @recently_discounted_item = @discounted_items. order. last
		# @recently_added_item = Items .last
	end

	def about
	end

	def contact
	end

	def privacy
	end

	def sandbox
		
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
  
end