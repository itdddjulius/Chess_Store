class ItemsController < ApplicationController
	helper ItemsHelper
	# autocomplete :item, :name, :full => true
	before_action :check_login, except: [:browse, :details]
  
	PER_PAGE = 9

	before_action :set_item, only: [:show, :edit, :update, :destroy]

	def index
		# get info on active items for the big three...
		@boards = Item.active.for_category('boards').alphabetical.paginate(:page => params[:page]).per_page(10)
		@pieces = Item.active.for_category('pieces').alphabetical.paginate(:page => params[:page]).per_page(10)
		@clocks = Item.active.for_category('clocks').alphabetical.paginate(:page => params[:page]).per_page(10)
		@supplies = Item.active.for_category('supplies').alphabetical.paginate(:page => params[:page]).per_page(10)    
		# get a list of any inactive items for sidebar
		@inactive_items = Item.inactive.alphabetical.to_a
	end

	def show
		# get the price history for this item
		@price_history = @item.item_prices.chronological.to_a
		# everyone sees similar items in the sidebar
		@similar_items = Item.for_category(@item.category).active.alphabetical.to_a - [@item]
	end

	def new
		@item = Item.new
	end

	def edit
	end

	def create
		@item = Item.new(item_params)
		
		if @item.save
			redirect_to item_path(@item), notice: "Successfully created #{@item.name}."
		else
			render action: 'new'
		end
	end

	def update
		if @item.update(item_params)
			redirect_to item_path(@item), notice: "Successfully updated #{@item.name}."
		else
			render action: 'edit'
		end
	end

	def destroy
		@item.destroy
		redirect_to items_path, notice: "Successfully removed #{@item.name} from the system."
	end

	def browse
		@items = Item.active

		# Categories
		if params.has_key?(:category)
			@items = itemsForCategories(@items, params[:category])
		else
			@items = Item.all
		end

		# Sort
		@items = @items.to_a
		if params.has_key?(:sort)
			@items = itemsSorted(@items, params[:sort])
		else
			@items.sort_by! { |item| item.name }
		end

		# Paginating
		@items = @items.paginate(:page => params[:page], :per_page => PER_PAGE)
	end

	private
	def set_item
		@item = Item.find(params[:id])
	end

	def item_params
		params.require(:item).permit(:name, :description, :color, :category, :weight, :inventory_level, :reorder_level, :active)
	end
	
	# takes in array of categories and dan activerecord of items and returns an ActiveRecord of those categories
	def itemsForCategories(items, categories)
		if categories.kind_of? Array
			conditions = []

			for category in categories
				conditions.push("items.category = '#{category}'")
			end

			return items.where(conditions.join(" OR "))
		else
			return items.for_category(categories)
		end
	end

	# takes in a sort method and an array of items
	def itemsSorted(items, sort)
		#price low to high
		if sort == "pricelow"
			items.sort! { |a, b| ( a.current_price and b.current_price ) ? a.current_price <=> b.current_price 
				: ( a.current_price ? -1 : 1 ) }
		# price high to low
		elsif sort == "pricehigh"
			items.sort! { |a, b| ( a.current_price and b.current_price ) ? b.current_price <=> a.current_price 
				: ( a.current_price ? -1 : 1 ) }
		# alphabetical
		elsif sort == "alphabetical"
			items.sort_by! { |item| item.name }
		# not specified, alphabetical
		else
			items.sort_by! { |item| item.name }
		end
	end
end