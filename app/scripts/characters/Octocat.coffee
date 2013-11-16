define ["characters/ClassicShape", "physics/PhysicConstants", "utils/ArrayUtils"], (ClassicShape, PhysicConstants) ->

	class Octocat extends PIXI.DisplayObjectContainer
		constructor: ->
			super()
			@position.x = @position.y = 100
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

		move: (y) =>
			@position.y += y

		jump: =>
			if @isJumping then return

			@speedY += @jumpingSpeed()
			@isJumping = true

		stopJump: =>
			@speedY = 0
			@isJumping = false

		morph: (newShape) =>
			@shape.morphInto @, newShape

		setShape: (newShape) =>
			@removeChild @shape
			@shape = newShape
			@addChild @shape

		_walk: (speed) =>
			@position.x += speed
			@shape.move?()

		_sufferFromGravityEffects: =>
			@speedY += PhysicConstants.gravitySpeed()
			@move @speedY

