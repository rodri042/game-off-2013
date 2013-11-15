define ["engine/Game", "characters/ClassicShape", "characters/RainbowShape"], (Game, ClassicShape, RainbowShape) ->

	class Morphtocat extends Game
		constructor: (@world) ->
			super @assets(), =>
				@init(); @gameLoop

		init: =>
			@octocat = @world.init()

			keys = @world.keys
			keys.left = => @octocat.moveLeft()
			keys.right = => @octocat.moveRight()
			keys.r = => @octocat.morph new RainbowShape()
			keys.c = => @octocat.morph new ClassicShape()
			keys.space = => @octocat.jump()

			@world.addChild new PIXI.Text("Flechas, Espacio, R, C", fill: "black")

		gameLoop: =>
			@world.render()

			#game logic

			if (@world.collidesOnBottom @octocat)
				@world.placeOnFloor @octocat
				@octocat.isNotJumpingAnymore()

		assets: => [
			"assets/sprites/classic.json"
			"assets/sprites/rainbow.json"
			"assets/sprites/classic-rainbow.json"
			"assets/world/night-long.json"
		]
