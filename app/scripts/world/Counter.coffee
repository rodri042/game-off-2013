define ["pixi"], ->

	class Counter extends PIXI.Text
		constructor: (@elements, @label) ->
			super label, fill: "black"
			@position.x = @position.y = 8

		render: => @setText @label + @count()
		
		count: => @elements.length
