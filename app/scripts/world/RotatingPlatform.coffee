define ["world/Platform"], (Platform) ->

	class RotatingPlatform extends Platform
		constructor: (textureName, x, y) ->
			super textureName, x, y
			@anchor.x = 0.5
			@factor = 0.005

		#properties
		limit: => 0.1

		#methods
		render: =>
			@rotation += @factor
			if @rotation > @limit() || @rotation < -@limit()
				@factor *= -1

		_collidesOnX: (anObject) =>
			@position.x - @width / 2 < anObject.position.x < @position.x + @width / 2