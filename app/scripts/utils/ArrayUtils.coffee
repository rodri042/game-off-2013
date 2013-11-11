define [], ->

	Array::contains = (item) ->
		@indexOf(item) >= 0

	Array::addIfNotExists = (item) ->
		if @contains item then return
		@push item

	Array::remove = (item) ->
		index = @indexOf item
		@splice index, 1