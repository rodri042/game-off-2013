define ["characters/ClassicShape", "physics/PhysicConstants", "utils/ArrayUtils"], (ClassicShape, PhysicConstants) ->

	class Octocat extends PIXI.DisplayObjectContainer
		constructor: ->
			super()
			@shape = new ClassicShape()
			@addChild @shape
			@speedY = 0

		render: =>
			@sufferFromGravityEffects()
			@shape.render?()

		sufferFromGravityEffects: =>
			@speedY += PhysicConstants.gravitySpeed()
			@move @speedY

		moveRight: => @walk @speed()
		moveLeft: => @walk -@speed()

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

		jumpingSpeed: => @shape.jumpingSpeed()

		jump: =>
			if @isJumping then return

			@speedY += @jumpingSpeed()
			@isJumping = true

		isNotJumpingAnymore: =>
			@speedY = 0
			@isJumping = false
