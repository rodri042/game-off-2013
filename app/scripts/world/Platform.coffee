define ['engine/Sprite'], (Sprite) ->

	class Platform extends Sprite
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