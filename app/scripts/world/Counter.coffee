define ["pixi"], ->

	class Counter extends PIXI.Text
		constructor: (@sky, y) ->
			super @count(), { fill: "white", font: "18px Calibri" }
			@position.y = @sky.height - @height

		#properties
		count: =>
			count = -@sky.tilePosition.x.toFixed 2
			if count < 0 then count = 0
			"#{count} m"

		#methods
		render: => @setText @count()
