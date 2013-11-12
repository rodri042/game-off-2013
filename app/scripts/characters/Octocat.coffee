define ["characters/ClassicShape"], (ClassicShape) ->

	class Octocat extends PIXI.DisplayObjectContainer
		constructor: ->
			super()
			@shape = new ClassicShape()
			@addChild @shape

		render: => @shape.render?()

		moveRight: => @move @speed(), 0
		moveLeft: => @move -@speed(), 0

		speed: => 3

		move: (x, y) =>
			@position.x += x
			@position.y += y
			@shape.move?()

		morph: (newShape) =>
			@shape.morphInto @, newShape

		setShape: (newShape) =>
			@removeChild @shape
			@shape = newShape
			@addChild @shape

