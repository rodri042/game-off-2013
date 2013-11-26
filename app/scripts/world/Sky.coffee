define ["engine/TilingSprite"], (TilingSprite) ->

	class Sky extends TilingSprite
		constructor: (@resolution, @octocat, @staticObjects) ->
			super "night-long.png", @resolution.width, @resolution.height

		#properties
		scrollSpeed: => 1

		#methods
		render: =>
			@staticObjects.forEach (it) =>
				it.position.x = @tilePosition.x + it.absolutePosition.x

			@goLeft()
			@octocat.position.x -= @scrollSpeed()

		goTo: (positionX) => @tilePosition.x = positionX

		goLeft: => @tilePosition.x -= @scrollSpeed()