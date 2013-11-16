define ["engine/Stage", "world/RotatingPlatform", "world/Sky", "characters/Octocat", "utils/ArrayUtils"], (Stage, RotatingPlatform, Sky, Octocat) ->

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

			currentPlatform = @currentPlatformOf @octocat
			@octocat.isInAir !currentPlatform?

			if currentPlatform?
				currentPlatform.placeOnFloor @octocat

		currentPlatformOf: (anObject) =>
			if @collidesOnBottom @octocat then return @
			@staticObjects.findOne (it) => it.isOnPlatform @octocat 

		addStaticObject: (anObject, zIndex) =>
			@addChildAt anObject, zIndex
			@staticObjects.push anObject

		_createSky: =>
			@sky = new Sky(@resolution, @octocat, @staticObjects)
			@addChildAt @sky, 0
			@sky.goTo 200

		_addPlatform: =>
			plataform = new RotatingPlatform("platform.png", 310, 111 + 200)
			@addStaticObject plataform, 1

		_addOctocat: =>
			@addChildAt @octocat, 2