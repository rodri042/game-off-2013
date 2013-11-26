define ["characters/ClassicShape", "physics/Gravity", "engine/Jukebox", "utils/ArrayUtils"], (ClassicShape, Gravity, Jukebox) ->

	class Octocat extends PIXI.DisplayObjectContainer
		constructor: ->
			super()
			@absolutePosition = x: 0, y: 0
			@move 100, 100

			@shape = new ClassicShape()
			@addChild @shape
			@speedY = 0
			@_isInAir = true
			@gravity = new Gravity()

		#properties
		speed: => @shape.speed()
		width: => @shape.width
		height: => @shape.height
		jumpingSpeed: => @shape.jumpingSpeed()
		isGoingUp: => @speedY < 0
		isInAir: (air) =>
			if air? #setter
				@_isInAir = air
				if !air
					@speedY = 0
					@gravity.resetSpeed()
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
			Jukebox.play "octocat-jumping"

		morph: (newShape) =>
			@shape.morphInto @, newShape

		setShape: (newShape) =>
			@removeChild @shape
			@shape = newShape
			@addChild @shape

		move: (x, y) =>
			y = y || 0
			@position.x += x; @position.y += y
			@absolutePosition.x += x; @absolutePosition.y += y

		_walk: (speed) =>
			@move speed, 0
			@shape.move?()

		_sufferFromGravityEffects: =>
			@speedY += @gravity.actualSpeed
			@gravity.timeHasPassed()
			@move 0, @speedY
