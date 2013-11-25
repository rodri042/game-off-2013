define ["engine/Stage", "world/Platform", "world/MovingPlatform", "world/Sky", "characters/Octocat", "utils/ArrayUtils"], (Stage, Platform, MovingPlatform, Sky, Octocat) ->

	class World extends Stage
		constructor: (resolution, background) ->
			super resolution, background
			@staticObjects = []

		#methods
		init: =>
			@octocat = new Octocat()

			@_createSky()
			@_addPlatforms()
			@_addOctocat()

			@octocat

		render: =>
			super()

			currentPlatform = @currentPlatformOf @octocat
			@octocat.isInAir !currentPlatform?

			if currentPlatform?
				currentPlatform.placeOnFloor @octocat

			#@sky.goLeft()

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

		_addPlatforms: =>
			platform = new Platform "platform.png", 310, 111 + 200
			platform.rotation = 0.2
			@addStaticObject platform, 1

			movingPlatform = new MovingPlatform 1500, 200
			@addStaticObject movingPlatform, 1

		_addOctocat: =>
			@addChildAt @octocat, 2
