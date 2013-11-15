define ["engine/TilingSprite"], (TilingSprite) ->

	class World extends TilingSprite
		constructor: (@resolution, @octocat) ->
			super "../assets/world/night-long.jpg", @resolution.width, @resolution.height

			@octocatPosition = @octocat.position.x

		render: =>
			deltaX = @octocat.position.x - @octocatPosition
			@tilePosition.x -= deltaX
			@octocat.position.x = @octocatPosition