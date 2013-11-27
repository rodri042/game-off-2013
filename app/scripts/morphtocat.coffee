define ["pixi", "engine/Game", "characters/ClassicShape", "characters/RainbowShape", "characters/DojocatShape", "world/LoseScreen"], (PIXI, Game, ClassicShape, RainbowShape, DojocatShape, LoseScreen) ->

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
			"assets/world/ruby-platform.json"
			"assets/world/parallaxcat.json"
			"assets/world/desert.json"
		]

		#methods
		init: =>
			@octocat = @world.init()

			@_bindKeys()

			@world.addChild new PIXI.Text("Flechas, Espacio, C, R, D", fill: "black")

			Morphtocat.Speed = 0

		gameLoop: =>
			@world.render()

			if @died then return
			@_checkIfOctocatIsOutOfScreen()

			@_increaseGlobalSpeed()
			
		_checkIfOctocatIsOutOfScreen: =>
			if @octocat.position.x + @octocat.width() / 2 < 0
				@_endGame()

		_endGame: =>
			@died = true
			@world.clear()
			@world.addChild new LoseScreen()
			@world.keys.enter = => window.initGame()

		_increaseGlobalSpeed: => Morphtocat.Speed += .01

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