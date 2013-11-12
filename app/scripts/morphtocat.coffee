define ["engine/Game", "world/Sky", "characters/Octocat", "characters/ClassicShape", "characters/RainbowShape"], (Game, Sky, Octocat, ClassicShape, RainbowShape) ->

	class Morphtocat extends Game
		constructor: (@stage) ->
			super @assets(), =>
				@init(); @gameLoop

		init: =>
			@sky = @stage.addChild new Sky()
			@octocat = @stage.addChildCentered new Octocat()

			keys = @stage.keys
			keys.left = => @octocat.moveLeft()
			keys.right = => @octocat.moveRight()
			keys.r = => @octocat.morph new RainbowShape()
			keys.c = => @octocat.morph new ClassicShape()
			keys.space = => @octocat.jump()

			@stage.addChild new PIXI.Text("Flechas, R, C", fill: "black")

		gameLoop: =>
			@stage.render()

			#game logic

			if (@stage.collidesOnBottom @octocat)
				@octocat.stopFalling()

		assets: => [
			"assets/sprites/classic.json",
			"assets/sprites/rainbow.json",
			"assets/sprites/classic-rainbow.json"
		]