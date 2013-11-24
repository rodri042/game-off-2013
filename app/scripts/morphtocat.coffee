define ["engine/Game", "characters/ClassicShape", "characters/RainbowShape", "characters/DojocatShape"], (Game, ClassicShape, RainbowShape, DojocatShape) ->

	class Morphtocat extends Game
		constructor: (@world) ->
			super @assets(), =>
				@init(); @gameLoop

		#properties
		assets: => [
			"assets/sprites/classic.json"
			"assets/sprites/rainbow.json"
			"assets/sprites/dojocat.json"
			"assets/sprites/classic-rainbow.json"
			"assets/sprites/classic-dojocat.json"
			"assets/sprites/rainbow-dojocat.json"
			"assets/world/night-long.json"
			"assets/world/platform.json"
		]

		#methods
		init: =>
			@octocat = @world.init()

			@_bindKeys()
		
			@world.addChild new PIXI.Text("Flechas, Espacio, C, R, D", fill: "black")

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
			keys.d = => @octocat.morph new DojocatShape()
			keys.space = => @octocat.jump()
