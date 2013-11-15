define ["engine/Stage", "engine/Sprite", "world/Sky", "characters/Octocat"], (Stage, Sprite, Sky, Octocat) ->

	class World extends Stage
		constructor: (resolution, background) ->
			super resolution, background
			@staticObjects = []

		init: =>
			@octocat = @stage.center new Octocat(), 20

			@_createSky()
			@_addPlatform()
			@_addOctocat()

			@octocat

		addStaticObject: (anObject) =>
			@addChildCentered anObject
			@staticObjects.push anObject

		_createSky: =>
			@addChild new Sky(@resolution, @octocat, @staticObjects)

		_addOctocat: =>
			@addChildAt @octocat, 1

		_addPlatform: =>
			@addStaticObject new Sprite("assets/world/platform.png")
