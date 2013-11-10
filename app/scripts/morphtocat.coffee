define ['engine/Game', 'characters/Octocat'], (Game, Octocat) ->

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

		gameLoop: =>
			@stage.render()

			#código del juego

		assets: => [
				"assets/sprites/classic-octocat.json"
			]