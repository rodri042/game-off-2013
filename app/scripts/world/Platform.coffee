define ["engine/Sprite"], (Sprite) ->

	class Platform extends Sprite
		constructor: (textureName, x, y) ->
			super textureName
			@position.y = y
			@relativePosition = @position
			@absolutePosition = x: x, y: y

		#methods
		placeOnFloor: (anObject) =>
			anObject.position.y = @position.y - anObject.height() / 2

		isOnTop: (anObject) =>
			@_collidesOnX(anObject) && @_isTouchingSurface(anObject) && not anObject.isGoingUp()

		_collidesOnX: (anObject) =>
			@position.x < anObject.position.x < @position.x + @width

		_isTouchingSurface: (anObject) =>
			delta = 8
			@position.y - delta < anObject.position.y + anObject.height() / 2 < @position.y + delta