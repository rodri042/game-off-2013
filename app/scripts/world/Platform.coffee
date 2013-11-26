define ["engine/Sprite"], (Sprite) ->

	class Platform extends Sprite
		constructor: (textureName, x, y) ->
			super textureName
			@position.y = y
			@relativePosition = @position
			@absolutePosition = x: x, y: y
			@anchor.x = 0.5
			@collisionToleranceOffset = 15

		#properties
		leftCornerX: => @position.x - @width * @anchor.x
		nonWalkableMargin: => 0
		rightCornerY: => @width * Math.tan @rotation

		#methods
		placeOnFloor: (anObject) =>
			anObject.position.y = @_calculateY(anObject) - @collisionToleranceOffset

		isOnPlatform: (anObject) =>
			@_collidesOnX(anObject) && not anObject.isGoingUp() && @_isTouchingSurface(anObject)

		_collidesOnX: (anObject) =>
			@leftCornerX() + @nonWalkableMargin() < anObject.position.x < @leftCornerX() + @width - @nonWalkableMargin()

		_isTouchingSurface: (anObject) =>
			expectedY = @_calculateY anObject
			expectedY - @collisionToleranceOffset <= anObject.position.y <= expectedY + @collisionToleranceOffset

		_calculateY: (anObject) =>
			currentY = @position.y + anObject.absolutePosition.x * @rightCornerY() / @width
			currentY - @height / 2
