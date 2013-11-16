define ["characters/ClassicShape", "physics/PhysicConstants", "utils/ArrayUtils"], (ClassicShape, PhysicConstants) ->

	class Octocat extends PIXI.DisplayObjectContainer
		constructor: ->
			super()
			@absolutePosition = x: 0, y: 0
			@_move 100, 100

			@shape = new ClassicShape()
			@addChild @shape
			@speedY = 0
			@_isInAir = true

		#properties
		speed: => 3
		width: => @shape.width
		height: => @shape.height
		jumpingSpeed: => @shape.jumpingSpeed()
		isGoingUp: => @speedY < 0
		isInAir: (air) =>
			if air? #setter
				@_isInAir = air
				if !air
					@speedY = 0
			else #getter
				@_isInAir

		#methods
		render: =>
			@_sufferFromGravityEffects()
			@shape.render?()

		moveLeft: => @_walk -@speed()

		moveRight: => @_walk @speed()

		jump: =>
			if @isInAir() then return

			@speedY += @jumpingSpeed()

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