define ["characters/ClassicShape", "physics/PhysicConstants", "utils/ArrayUtils"], (ClassicShape, PhysicConstants) ->

	class Octocat extends PIXI.DisplayObjectContainer
		constructor: ->
			super()
			@absolutePosition = x: 0, y: 0
			@_move 100, 100

			@shape = new ClassicShape()
			@addChild @shape
			@speedY = 0

		#properties
		speed: => 3
		width: => @shape.width
		height: => @shape.height
		jumpingSpeed: => @shape.jumpingSpeed()
		isGoingUp: => @speedY < 0

		#methods
		render: =>
			@_sufferFromGravityEffects()
			@shape.render?()

		moveLeft: => @_walk -@speed()

		moveRight: => @_walk @speed()

		jump: =>
			if @isJumping then return

			@speedY += @jumpingSpeed()
			@isJumping = true

		isNotJumpingAnymore: =>
			@speedY = 0
			@isJumping = false

		morph: (newShape) =>
			@shape.morphInto @, newShape

		setShape: (newShape) =>
			@removeChild @shape
			@shape = newShape
			@addChild @shape

		_move: (x, y) =>
			y = y || 0
			@position.x += x; @position.y += y
			@absolutePosition.x += x; @absolutePosition.y += y

		_walk: (speed) =>
			@_move speed, 0
			@shape.move?()

		_sufferFromGravityEffects: =>
			@speedY += PhysicConstants.gravitySpeed()
			@_move 0, @speedY