module ItemsHelper
	# browse statement
	def getBrowseState()
		state = "Showing "
		# search
		if params.has_key?(:term)
			state += "'#{params[:term]}'"
		else
			state += "all items"
		end

		state += " in "
		# categories
		if params.has_key?(:category)
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
