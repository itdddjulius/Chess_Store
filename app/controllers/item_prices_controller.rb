class ItemPricesController < ApplicationController
	before_action :check_login

	def index
		@active_items = Item.active.alphabetical.to_a
	end

	def new
		@item_price = ItemPrice.new
		@item = Item.find_by_id(params[:item_id])

		respond_to do |format|
		    format.html
		    format.js { render '/items/new_item_price.js.erb' }
		end
	end

	def create
		@item_price = ItemPrice.new(item_price_params)
		@item_price.start_date = Date.current

		if @item_price.save
			@item = @item_price.item
			@price_history = @item.item_prices.chronological.to_a.take(8)
			@price_history_m = @item.item_prices.manufacturer.chronological.to_a.take(8)
			respond_to do |format|
			    format.html { redirect_to item_path(@item), notice: "Changed the price of #{@item.name}." }
			    format.js { render '/items/success_item_price.js.erb' }
			end
		else
			respond_to do |format|
			    format.html { render action: 'new' }
			    format.js { render '/items/fail_item_price.js.erb' }
			end
		end
	end

	private
	def item_price_params
		params.require(:item_price).permit(:item_id, :price, :category)
	end
	
end