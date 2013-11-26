define ["engine/Sprite"], (Sprite) ->

	class Platform extends Sprite
		constructor: (textureName, x, y) ->
			super textureName
			@position.x = x
			@position.y = y
			@absoluteX = x

			@anchor.x = 0.5
			@collisionToleranceOffset = 15

		#properties
		nonWalkableMargin: => 0
		leftCornerX: => @position.x - @width * @anchor.x
		rightCorner: =>
			x: @leftCornerX() + @width
			y: @width * Math.tan @rotation

		#methods
		placeOnFloor: (anObject) =>
			anObject.position.y = @_calculateY(anObject) - @collisionToleranceOffset

		isOnPlatform: (anObject) =>
			@_collidesOnX(anObject) && not anObject.isGoingUp() && @_isTouchingSurface(anObject)

		_collidesOnX: (anObject) =>
			@leftCornerX() + @nonWalkableMargin() < anObject.position.x < @rightCorner().x - @nonWalkableMargin()

		_isTouchingSurface: (anObject) =>
			expectedY = @_calculateY anObject
			expectedY - @collisionToleranceOffset <= anObject.position.y <= expectedY + @collisionToleranceOffset

		_calculateY: (anObject) =>
			currentY = @position.y + anObject.absoluteX * @rightCorner().y / @width
			currentY - @height / 2
