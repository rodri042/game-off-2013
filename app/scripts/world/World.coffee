define ["engine/TilingSprite"], (TilingSprite) ->

	class World extends TilingSprite
		constructor: (@resolution) ->
			super "../assets/world/night-long.jpg", @resolution.width, @resolution.height

		render: =>
			@tilePosition.x--