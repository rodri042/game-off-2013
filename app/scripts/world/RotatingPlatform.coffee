define ["world/Platform"], (Platform) ->

	class RotatingPlatform extends Platform
		constructor: (textureName, x, y) ->
			super textureName, x, y
			@factor = 0.005
			@rotation = 0.2 #borrar hack

		#properties
		limit: => 0.1

		#methods
		render: =>
			#@rotation += @factor
			#if @rotation > @limit() || @rotation < -@limit()
			#	@factor *= -1