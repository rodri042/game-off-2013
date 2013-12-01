define ["engine/Stage", "world/Platform", "world/MovingPlatform", "world/Sky", "characters/Octocat", "utils/Randomizer", "objects/Octoball", "utils/ArrayUtils"], (Stage, Platform, MovingPlatform, Sky, Octocat, Randomizer, Octoball) ->

	class World extends Stage
		constructor: (resolution, background) ->
			super resolution, background

		#methods
		init: =>
			@clear()
			@staticObjects = []
			@octocat = new Octocat()

			@_createSky()
			@_addOctocat()

			@octocat

		render: =>
			super()

			currentPlatform = @currentPlatformOf @octocat
			@octocat.isInAir !currentPlatform?

			if currentPlatform?
				currentPlatform.placeOnFloor @octocat

			@_randomizeWorld()

			@staticObjects.removeItemsThat (it) =>
				it.position.x <= -500

		currentPlatformOf: (anObject) =>
			if @collidesOnBottom @octocat then return @
			@staticObjects.findOne (it) => it.isOnPlatform @octocat

		addStaticObject: (anObject) =>
			@addChildAt anObject, 1
			@staticObjects.push anObject

		_randomizeWorld: =>
			random = (min, max) => new Randomizer(min, max).get()

			offset = random(1000, 1100)
			if not @_canAddObjectsIn @octocat.absoluteX + offset, 300
				return

			if random(1, 100) <= 10
				@_addOctoball @octocat.absoluteX + offset, random(50, 450)
			else if random(1, 100) < 3
				@_addRuby @octocat.absoluteX + offset, random(250, 350)

		_canAddObjectsIn: (x, delta) =>
			!@staticObjects.findOne((it) =>
				it.absoluteX - delta <= x <= it.absoluteX + delta
			)?

		_createSky: =>
			@sky = new Sky(@resolution, @octocat, @staticObjects)
			@addChildAt @sky, 0
			@sky.goTo 200

		_addTable: (x, y, rotation) =>
			platform = new Platform "platform.png", x, y
			platform.rotation = rotation
			@addStaticObject platform

		_addRuby: (x, y) =>
			@addStaticObject new MovingPlatform x, y

		_addOctoball: (x, y) =>
			@addStaticObject new Octoball x, y

		_addOctocat: =>
			@addChildAt @octocat, 1
