define ['pixi'], ->

	class Counter extends PIXI.Text
		constructor: (@elements, @label) ->
			super label, fill: "black"
			@position.x = @position.y = 8

		count: => @elements.length		

		render: => @setText @label + @count()
