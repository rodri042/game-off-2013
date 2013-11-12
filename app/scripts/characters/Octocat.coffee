define ["characters/ClassicShape"], (ClassicShape) ->

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
			@shape.morphInto @, newShape

		finishTransformation: =>
			@_changeShape @transformingTo
			@transformingTo = null

		_changeShape: (newShape) =>
			@removeChild @shape
			@shape = newShape
			@addChild @shape

