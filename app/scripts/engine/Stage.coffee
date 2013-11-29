define ["jquery", "utils/Keyboard", "pixi"], ($, Keyboard) ->

	class Stage extends PIXI.Stage
		constructor: (@resolution, background) ->
			super background

			@renderer = PIXI.autoDetectRenderer @resolution.width, @resolution.height
			@clear()

			@lastZIndex = 0

		#properties
		width: => @renderer.width
		height: => @renderer.height
		view: => @renderer.view

		#methods
		center: (anObject, xPercent) =>
			xPercent = xPercent || 50
			anObject.position.x = @width() * xPercent / 100
			anObject.position.y = @height() / 2
			anObject

		render: =>
			@keys.raiseEvents()

			@children.forEach (it) => it.render?()
			@renderer.render @

		addChild: (aChild) =>
			super aChild
			aChild

		addChildCentered: (aChild, xPercent) =>
			@center aChild, xPercent
			@addChild aChild
			aChild

		collidesOnTop: (anObject) =>
			anObject.position.y - anObject.height() / 2 < @position.y

		collidesOnBottom: (anObject) =>
			anObject.position.y + anObject.height() > @position.y + @height()

		collidesOnLeft: (anObject) =>
			anObject.position.x - anObject.width() / 2 < @position.x

		collidesOnRight: (anObject) =>
			anObject.position.x + anObject.width() / 2 > @position.x + @width()

		placeOnFloor: (anObject) =>
			anObject.position.y = @height() - anObject.height()

		clear: =>
			@keys = new Keyboard $(window)

		onClick: (action) =>
			$(@view()).click action
