define ["engine/TilingSprite"], (TilingSprite) ->

	class World extends TilingSprite
		constructor: (@resolution, @octocat) ->
			super "../assets/world/night-long.jpg", @resolution.width, @resolution.height

			@_updateOctocatPosition()

		render: =>
			deltaX = @octocat.position.x - @octocatPosition
			@tilePosition.x -= deltaX
			@_updateOctocatPosition()

		_updateOctocatPosition: =>
			@octocatPosition = @octocat.position.x