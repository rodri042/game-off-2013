define ["engine/Sprite"], (Sprite) ->

	class Platform extends Sprite
		constructor: (textureName, x, y) ->
			super textureName
			@position.y = y
			@relativePosition = @position
			@absolutePosition = x: x, y: y
			#anchor.x = 0.5 SACAR ESTE HACK

		#methods
		placeOnFloor: (anObject) =>
			anObject.position.y = @_calculateY anObject

		isOnTop: (anObject) =>
			@_collidesOnX(anObject) && @_isTouchingSurface(anObject) && not anObject.isGoingUp()

		_collidesOnX: (anObject) =>
			#@position.x - @width / 2 < anObject.position.x < @position.x + @width / 2
			@position.x < anObject.position.x < @position.x + @width

		_isTouchingSurface: (anObject) =>
			expectedY = @_calculateY anObject

			delta = 5
			expectedY - delta < anObject.position.y < expectedY + delta

		_calculateY: (anObject) =>
			lastY = @width * Math.tan @rotation
			currentY = @position.y + anObject.absolutePosition.x * lastY / @width
			currentY - anObject.height()