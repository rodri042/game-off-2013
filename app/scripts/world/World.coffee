define ["engine/TilingSprite"], (TilingSprite) ->

	class World extends TilingSprite
		constructor: (@resolution, @octocat) ->
			super "night-long.png", @resolution.width, @resolution.height

			@octocatPosition = @octocat.position.x

		render: =>
			deltaX = @octocat.position.x - @octocatPosition
			@tilePosition.x -= deltaX
			@octocat.position.x = @octocatPosition