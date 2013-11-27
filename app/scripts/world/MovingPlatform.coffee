define ["world/Platform", "utils/Randomizer"], (Platform, Randomizer) ->

	class MovingPlatform extends Platform
		constructor: (x, y) ->
			super "ruby-platform.png", x, y
			@displacement = 0
			@direction = 1

			@maximumDisplacement = new Randomizer(150, 300).get()

		#properties
		speed: => 3
		currentSpeed: => @speed() * @direction
		nonWalkableMargin: => 40

		#methods
		flip: => @direction *= -1

		render: =>
			if @displacement >= @maximumDisplacement
				@flip()

			if @displacement <= -@maximumDisplacement
				@flip()

			@absoluteX += @currentSpeed()
			@displacement += @currentSpeed()

		placeOnFloor: (anOctocat) =>
			super anOctocat
			anOctocat.move @currentSpeed()
