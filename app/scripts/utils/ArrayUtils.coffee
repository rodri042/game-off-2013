define [], ->

	Array::contains = (item) ->
		@indexOf(item) >= 0

	Array::addIfNotExists = (item) ->
		if @contains item then return
		@push item

	Array::remove = (item) ->
		index = @indexOf item
		@splice index, 1

	Array::isEmpty = ->
		@length == 0

	Array::sum = (transformation) ->
		@reduce ((acum, elem) -> acum + transformation elem), 0
