define ["pixi"], ->

	class Counter extends PIXI.Text
		constructor: (@elements, @label) ->
			super label, fill: "black"
			@position.x = @position.y = 8

		#properties
		count: => @elements.length

		#methods
		render: => @setText @label + @count()
