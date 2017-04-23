module ItemsHelper
	ALL_CATEGORIES = ["boards", "pieces", "clocks", "supplies"]
	# browse statement
	def getBrowseState()
		state = "Showing "
		# search
		if params.has_key?(:term)
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

end
