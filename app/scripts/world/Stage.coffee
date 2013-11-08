define ['pixi'], ->

	class Stage extends PIXI.Stage
		WIDTH = 1000
		HEIGHT = 600

		constructor: ->
			super 0xFFFFFF
			@renderer = PIXI.autoDetectRenderer WIDTH, HEIGHT

		center: (anObject) =>
			anObject.position.x = @width() / 2
			anObject.position.y = @height() / 2

		width: -> @renderer.width
		height: -> @renderer.height		

		render: =>
			@children.forEach (it) -> it.render()
			@renderer.render @

		addChildCentered: (aChild) =>
			@center aChild
			@addChild aChild
			aChild

		collidesOnLeft: (anObject) =>
			anObject.position.x - anObject.width / 2 < @position.x

		collidesOnTop: (anObject) =>
			anObject.position.y - anObject.width / 2 < @position.y

		collidesOnBottom: (anObject) =>
			anObject.position.y + anObject.width / 2 > @position.y + @height()

		collidesOnRight: (anObject) =>
			anObject.position.x + anObject.width / 2 > @position.x + @width()

		view: => @renderer.view

		onClick: (action) =>
			$(@view()).click action
