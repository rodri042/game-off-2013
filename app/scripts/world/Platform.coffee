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
		cornerX: => @position.x - @width * @anchor.x
		nonWalkableMargin: => 0

		#methods
		placeOnFloor: (anObject) =>
			anObject.position.y = @_calculateY(anObject) - @collisionToleranceOffset
		isOnPlatform: (anObject) =>
			@_collidesOnX(anObject) && not anObject.isGoingUp() && @_isTouchingSurface(anObject)

		_collidesOnX: (anObject) =>
			@cornerX() + @nonWalkableMargin() < anObject.position.x < @cornerX() + @width - @nonWalkableMargin()

		_isTouchingSurface: (anObject) =>
			expectedY = @_calculateY anObject
			expectedY - @collisionToleranceOffset <= anObject.position.y <= expectedY + @collisionToleranceOffset

		_calculateY: (anObject) =>
			if @rotation == 0
				return @position.y - @height / 2

			lastY = @width * Math.tan @rotation
			currentY = @position.y + anObject.absolutePosition.x * lastY / @width
			currentY - @height / 2
