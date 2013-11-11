define ["pixi", "utils/NumberUtils", "characters/ClassicOctocat"], (_, __, ClassicOctocat) ->

	class Octocat extends PIXI.DisplayObjectContainer
		constructor: ->
			super()
			@shape = new ClassicOctocat()
			@addChild @shape

		render: =>
			@shape.render?()

		move: (x, y) =>
			@position.x += x
			@position.y += y
			@shape.move()