module ItemsHelper
	ALL_CATEGORIES = ["boards", "pieces", "clocks", "supplies"]
	THUMBNAIL_DIR = "items/thumbnails"
	IMAGE_DIR = "items"
	# browse statement
	def getBrowseState()
		state = "Showing "
		# search
		if params.has_key?(:term) && params[:term] != ''
			state += "results for '#{params[:term]}'"
		else
			state += "items"
		end

		state += " in "
		# categories
		if params.has_key?(:category) && params[:category] != ALL_CATEGORIES
			if params[:category].kind_of? Array
				state += "'#{params[:category].join(", ")}'"
			else
				state += "'#{params[:category]}'"
			end
		else
			state += "all categories"
		end
		# state += "..."

		return state
	end

	# supports pngs and jpegs in assets/images/items/thumbnails
	# return the "No Image" image path if not found
	def getThumbnailPath(itemName)
		if Rails.application.assets.find_asset THUMBNAIL_DIR + "/#{itemName}.jpeg"
			return THUMBNAIL_DIR + "/#{itemName}.jpeg"
		elsif Rails.application.assets.find_asset THUMBNAIL_DIR + "/#{itemName}.png"
			return THUMBNAIL_DIR + "/#{itemName}.png"
		else
			return THUMBNAIL_DIR + "/no-image.jpeg"
		end
	end

	def getImagePath(itemName)
		if Rails.application.assets.find_asset IMAGE_DIR + "/#{itemName}.jpeg"
			return IMAGE_DIR + "/#{itemName}.jpeg"
		elsif Rails.application.assets.find_asset IMAGE_DIR + "/#{itemName}.png"
			return IMAGE_DIR + "/#{itemName}.png"
		else
			return IMAGE_DIR + "/no-image.jpeg"
		end
	end
end
