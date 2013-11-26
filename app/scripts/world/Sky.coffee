define ["engine/TilingSprite", "morphtocat"], (TilingSprite, Morphtocat) ->

	class Sky extends TilingSprite
		constructor: (@resolution, @octocat, @staticObjects) ->
			super "night-long.png", @resolution.width, @resolution.height

		#properties
		scrollSpeed: => Morphtocat.Speed + 1

		#methods
		render: =>
			@staticObjects.forEach (it) =>
				it.position.x = @tilePosition.x + it.absoluteX

			@goLeft()

			@octocat.position.x = @tilePosition.x + @octocat.absoluteX

		goTo: (positionX) => @tilePosition.x = positionX

		goLeft: => @tilePosition.x -= @scrollSpeed()