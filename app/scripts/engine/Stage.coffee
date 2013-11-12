define ["jquery", "pixi", "utils/Keyboard", "world/Sky"], ($, _, Keyboard, Sky) ->

	class Stage extends PIXI.Stage
		constructor: (@resolution, background) ->
			super background

			@renderer = PIXI.autoDetectRenderer @resolution.width, @resolution.height
			@keys = new Keyboard $(window)
			@addChild new Sky()

		center: (anObject) =>
			anObject.position.x = @width() / 2
			anObject.position.y = @height() / 2

		width: -> @renderer.width
		height: -> @renderer.height		

		render: =>
			@keys.raiseEvents()

			if (@collidesOnBottom @octocat)
				@octocat.stopFalling()

			@children.forEach (it) -> it.render?()
			@renderer.render @

		addChildCentered: (aChild) =>
			@center aChild
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

		addOctocat: (anOctocat) =>
			@addChildCentered anOctocat
			@octocat = anOctocat

		view: => @renderer.view

		onClick: (action) =>
			$(@view()).click action
