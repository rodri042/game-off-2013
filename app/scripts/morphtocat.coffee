define ["engine/Game", "characters/ClassicShape", "characters/RainbowShape"], (Game, ClassicShape, RainbowShape) ->

	class Morphtocat extends Game
		constructor: (@world) ->
			super @assets(), =>
				@init(); @gameLoop

		#properties
		assets: => [
			"assets/sprites/classic.json"
			"assets/sprites/rainbow.json"
			"assets/sprites/classic-rainbow.json"
			"assets/world/night-long.json"
		]

		#methods
		init: =>
			@octocat = @world.init()

			@_bindKeys()

			@world.addChild new PIXI.Text("Flechas, Espacio, R, C", fill: "black")

		gameLoop: =>
			@world.render()

		_bindKeys: =>
			keys = @world.keys
			keys.left = => @octocat.moveLeft()
			keys.right = => @octocat.moveRight()
			keys.down = =>
			keys.up = =>
			keys.r = => @octocat.morph new RainbowShape()
			keys.c = => @octocat.morph new ClassicShape()
			keys.space = => @octocat.jump()