define ["characters/ClassicShape", "physics/Gravity", "physics/Force", "utils/ArrayUtils"], (ClassicShape, Gravity, Force) ->

	class Octocat extends PIXI.DisplayObjectContainer
		constructor: ->
			super()
			@shape = new ClassicShape()
			@addChild @shape
			@isFalling = true
			@gravity = new Gravity @

		forces: =>
			[ @gravity, @force || new Force(0) ]

		render: => 
			@sufferFromGravityEffects()
			@shape.render?()

		sufferFromGravityEffects: =>
			@forces().forEach (it) -> it.timeHasPassed()
			@move @forces().sum (it) -> it.speed()

		moveRight: => @walk @speed()
		moveLeft: => @walk -@speed()

		mass: => .5
		speed: => 3

		width: => @shape.width
		height: => @shape.height

		walk: (speed) =>
			@position.x += speed
			@shape.move?()

		move: (y) =>
			@position.y += y

		morph: (newShape) =>
			@shape.morphInto @, newShape

		setShape: (newShape) =>
			@removeChild @shape
			@shape = newShape
			@addChild @shape

		stopFalling: =>
			@isFalling = false
			@gravity.resetTime()

		beginFalling: =>
			@isFalling = true

		jump: =>
			@setForce new Force(-20)

		setForce: (aForce) =>
			@force = aForce