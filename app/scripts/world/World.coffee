define ["engine/Stage", "world/Platform", "world/Sky", "characters/Octocat", "utils/ArrayUtils"], (Stage, Platform, Sky, Octocat) ->

	class World extends Stage
		constructor: (resolution, background) ->
			super resolution, background
			@staticObjects = []

		#methods
		init: =>
			@octocat = new Octocat()

			@_createSky()
			@_addPlatform()
			@_addOctocat()

			@octocat

		render: =>
			super()

			currentPlatform = @isStandingOnSomething @octocat

			if currentPlatform?
				currentPlatform.placeOnFloor @octocat
				@octocat.stopJump()

		isStandingOnSomething: (anObject) =>
			if @collidesOnBottom @octocat then return @
			@staticObjects.findOne (it) => it.isOnTop @octocat

		addStaticObject: (anObject) =>
			@addChildCentered anObject
			@staticObjects.push anObject

		_createSky: =>
			@addChild new Sky(@resolution, @octocat, @staticObjects)

		_addOctocat: =>
			@addChildAt @octocat, 1

		_addPlatform: =>
			@addStaticObject new Platform("assets/world/platform.png")