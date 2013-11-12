define ["engine/Game", "characters/Octocat", "characters/ClassicShape", "characters/RainbowShape"], (Game, Octocat, ClassicShape, RainbowShape) ->

	class Morphtocat extends Game
		constructor: (@stage) ->
			super @assets(), =>
				@init(); @gameLoop

		init: =>
			@octocat = new Octocat()
			@stage.addOctocat @octocat

			keys = @stage.keys
			keys.left = => @octocat.moveLeft()
			keys.right = => @octocat.moveRight()
			keys.r = => @octocat.morph new RainbowShape()
			keys.c = => @octocat.morph new ClassicShape()

			@stage.addChild new PIXI.Text("Flechas, R, C", fill: "black")

		gameLoop: =>
			@stage.render()

			#código del juego

		assets: => [
			"assets/sprites/classic.json",
			"assets/sprites/rainbow.json",
			"assets/sprites/classic-rainbow.json"
		]