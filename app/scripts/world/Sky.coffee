define ["engine/TilingSprite"], (TilingSprite) ->

	class Sky extends TilingSprite
		constructor: (@resolution, @octocat, @staticObjects) ->
			super "night-long.png", @resolution.width, @resolution.height

			@octocatPosition = @octocat.position.x

		#methods
		render: =>
			@staticObjects.forEach (it) =>
				it.position.x = @tilePosition.x + it.absolutePosition.x

			@goLeft()

		goTo: (positionX) => @tilePosition.x = positionX

		goLeft: => @tilePosition.x--