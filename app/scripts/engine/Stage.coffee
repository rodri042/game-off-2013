define ["jquery", "pixi", "utils/Keyboard"], ($, _, Keyboard) ->

	class Stage extends PIXI.Stage
		constructor: (@resolution, background) ->
			super background

			@renderer = PIXI.autoDetectRenderer @resolution.width, @resolution.height
			@keys = new Keyboard $(window)

		center: (anObject, xPercent) =>
			xPercent = xPercent || 50
			anObject.position.x = @width() * xPercent / 100
			anObject.position.y = @height() / 2
			anObject

		width: -> @renderer.width
		height: -> @renderer.height		

		render: =>
			@keys.raiseEvents()

			@children.forEach (it) -> it.render?()
			@renderer.render @

		addChildCentered: (aChild, xPercent) =>
			@center aChild, xPercent
			@addChild aChild
			aChild

		collidesOnLeft: (anObject) =>
			anObject.position.x - anObject.width() / 2 < @position.x

		collidesOnTop: (anObject) =>
			anObject.position.y - anObject.width() / 2 < @position.y

		collidesOnBottom: (anObject) =>
			anObject.position.y + anObject.width() / 2 > @position.y + @height()

		collidesOnRight: (anObject) =>
			anObject.position.x + anObject.width() / 2 > @position.x + @width()

		view: => @renderer.view

		onClick: (action) =>
			$(@view()).click action
