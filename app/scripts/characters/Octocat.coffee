define ["characters/ClassicShape", "characters/Transformation"], (ClassicShape, Transformation) ->

	class Octocat extends PIXI.DisplayObjectContainer
		constructor: ->
			super()
			@shape = new ClassicShape()
			@addChild @shape

		render: => @shape.render?()

		move: (x, y) =>
			@position.x += x
			@position.y += y
			@shape.move?()

		morph: (newShape) =>
			if (@transformingTo?) then return
			from = @shape.name()
			to = newShape.name()
			if (from == to) then return

			@transformingTo = newShape
			@_changeShape new Transformation(from, to)

			@shape
				.start()
				.done =>
					@_changeShape @transformingTo
					@transformingTo = null

		_changeShape: (newShape) =>
			@removeChild @shape
			@shape = newShape
			@addChild @shape

