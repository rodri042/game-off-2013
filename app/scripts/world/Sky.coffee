define ["engine/TilingSprite"], (TilingSprite) ->

	class Sky extends TilingSprite
		constructor: (@resolution, @octocat, @staticObjects) ->
			super "night-long.png", @resolution.width, @resolution.height

			@octocatPosition = @octocat.position.x

		#methods
		render: =>
			deltaX = @octocat.position.x - @octocatPosition
			@tilePosition.x -= deltaX
			@staticObjects.forEach (it) =>
				it.position.x = @tilePosition.x + it.absolutePosition.x
			@octocat.position.x = @octocatPosition

		goTo: (positionX) => @tilePosition.x = positionX

		goLeft: => @tilePosition.x--