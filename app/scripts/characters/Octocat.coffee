define ["characters/ClassicShape"], (ClassicShape) ->

	class Octocat extends PIXI.DisplayObjectContainer
		constructor: ->
			super()
			@shape = new ClassicShape()
			@addChild @shape
			@isFalling = true

		render: => 
			if @isFalling
				@sufferFromGravityEffects()

			@shape.render?()

		sufferFromGravityEffects: =>
			@move 0, @fallSpeed()

		moveRight: => @move @speed(), 0
		moveLeft: => @move -@speed(), 0

		fallSpeed: => 4
		speed: => 3

		width: => @shape.width
		height: => @shape.height

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

		stopFalling: =>
			@isFalling = false

