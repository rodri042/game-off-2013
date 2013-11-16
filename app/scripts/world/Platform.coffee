define ["engine/Sprite"], (Sprite) ->

	class Platform extends Sprite
		constructor: (textureName, x, y) ->
			super textureName
			@position.y = y
			@relativePosition = @position
			@absolutePosition = x: x, y: y
			@anchor.x = 0.5

		#properties
		cornerX: => @position.x - @width * @anchor.x

		#methods
		placeOnFloor: (anObject) =>
			anObject.position.y = @_calculateY anObject

		isOnTop: (anObject) =>
			@_collidesOnX(anObject) && @_isTouchingSurface(anObject) && not anObject.isGoingUp()

		_collidesOnX: (anObject) =>
			@cornerX() < anObject.position.x < @cornerX() + @width

		_isTouchingSurface: (anObject) =>
			expectedY = @_calculateY anObject

			delta = 8
			expectedY - delta < anObject.position.y < expectedY + delta

		_calculateY: (anObject) =>
			lastY = @width * Math.tan @rotation
			currentY = @position.y + anObject.absolutePosition.x * lastY / @width
			currentY - anObject.height()