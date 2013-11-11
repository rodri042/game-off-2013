define ["engine/Game", "characters/Octocat", "characters/RainbowShape"], (Game, Octocat, RainbowShape) ->

	class Morphtocat extends Game
		constructor: (@stage) ->
			super @assets(), =>
				@init(); @gameLoop

		init: =>
			@octocat = @stage.addChildCentered new Octocat()

			keys = @stage.keys
			keys.left = => @octocat.move -3, 0
			keys.right = => @octocat.move 3, 0
			keys.up = => @octocat.move 0, -3
			keys.down = => @octocat.move 0, 3
			keys.r = => @octocat.morph new RainbowShape()

		gameLoop: =>
			@stage.render()

			#código del juego

		assets: => [
				"assets/sprites/classic.json",
				"assets/sprites/rainbow.json",
				"assets/sprites/classic-rainbow.json"
			]