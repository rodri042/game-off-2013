define ['pixi', 'utils/NumberUtils'], ->

	class Octocat extends PIXI.MovieClip
		constructor: ->
			textures = [1..19].map (index) -> PIXI.Texture.fromFrame "octo#{index.toStringWithMinimumLength 4}.png"
			super textures

			@anchor.x = 0.5
			@anchor.y = 0.5

		render: =>
			@play()
