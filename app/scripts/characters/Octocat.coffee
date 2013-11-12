define ["characters/ClassicShape", "physics/Gravity"], (ClassicShape, Gravity) ->

	class Octocat extends PIXI.DisplayObjectContainer
		constructor: ->
			super()
			@shape = new ClassicShape()
			@addChild @shape
			@gravity = new Gravity @weight()
			@isFalling = true

		render: => 
			if @isFalling
				@sufferFromGravityEffects()

			@shape.render?()

		sufferFromGravityEffects: =>
			@gravity.timeHasPassed()
			@move 0, @gravity.speed()

		moveRight: => @move @speed(), 0
		moveLeft: => @move -@speed(), 0

		weight: => .5
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
			@gravity = new Gravity @weight()

		jump: =>
			@move 0, -3