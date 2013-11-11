define ["characters/ClassicShape", "characters/Transformation"], (ClassicShape, Transformation) ->

	class Octocat extends PIXI.DisplayObjectContainer
		constructor: ->
			super()
			@shape = new ClassicShape()
			@addChild @shape

			@transformingTo = null

		render: => @shape.render?()

		move: (x, y) =>
			@position.x += x
			@position.y += y
			@shape.move?()

		morph: (newShape) =>
			if (@transformingTo?) then return
			@transformingTo = newShape

			@_changeShape new Transformation(@shape.name, newShape.name)

			@shape
				.start()
				.done =>
					@_changeShape @transformingTo
					@transformingTo = null

		_changeShape: (newShape) =>
			@removeChild @shape
			@shape = newShape
			@addChild @shape

