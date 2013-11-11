define [], ->

	Array::addIfNotExists = (item) ->
		if @indexOf(item) >= 0 then return
		@push item

	Array::remove = (item) ->
		index = @indexOf item
		@splice index, 1