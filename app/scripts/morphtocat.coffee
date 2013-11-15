define ["engine/Game", "world/World", "characters/Octocat", "characters/ClassicShape", "characters/RainbowShape"], (Game, World, Octocat, ClassicShape, RainbowShape) ->

	class Morphtocat extends Game
		constructor: (@stage) ->
			super @assets(), =>
				@init(); @gameLoop

		init: =>
			@world = @stage.addChild new World @stage.resolution
			@octocat = @stage.addChildCentered new Octocat(@world)

			keys = @stage.keys
			keys.left = => @octocat.moveLeft()
			keys.right = => @octocat.moveRight()
			keys.r = => @octocat.morph new RainbowShape()
			keys.c = => @octocat.morph new ClassicShape()
			keys.space = => @octocat.jump()

			@stage.addChild new PIXI.Text("Flechas, Espacio, R, C", fill: "black")

		gameLoop: =>
			@stage.render()

			#game logic

			if (@stage.collidesOnBottom @octocat)
				@octocat.stopFalling()
			else
				@octocat.beginFalling()

		assets: => [
			"assets/sprites/classic.json",
			"assets/sprites/rainbow.json",
			"assets/sprites/classic-rainbow.json"
		]