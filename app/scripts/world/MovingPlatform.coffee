define ["world/Platform"], (Platform) ->

	class MovingPlatform extends Platform
		constructor: (x, y) ->
			super "ruby-platform.png", x, y
			@displacement = 0
			@direction = 1

		#properties
		maximumDisplacement: => 200
		speed: => 3
		currentSpeed: => @speed() * @direction
		nonWalkableMargin: => 40

		#methods
		flip: => @direction *= -1

		render: =>
			if @displacement >= @maximumDisplacement()
				@flip()

			if @displacement <= -@maximumDisplacement()
				@flip()

			@absolutePosition.x += @currentSpeed()
			@displacement += @currentSpeed()

		placeOnFloor: (anOctocat) =>
			super anOctocat
			anOctocat.position.x += @currentSpeed()
