define [], ->
	isAFunction = (obj) -> typeof obj == "function"

	Array::contains = (item) -> @indexOf(item) >= 0

	Array::addIfNotExists = (item) ->
		if @contains item then return
		@push item

	Array::remove = (item) ->
		index = @indexOf item
		@splice index, 1

	Array::isEmpty = -> @length == 0

	Array::sum = (transformation) ->
		if !isAFunction transformation then return
		@reduce ((acum, elem) -> acum + transformation elem), 0

	Array::first = -> @[0]

	Array::findOne = (criteria) ->
		if !isAFunction criteria then return
		@filter(criteria).first()