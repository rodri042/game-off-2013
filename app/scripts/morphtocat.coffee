define ['engine/Game', 'characters/Octocat'], (Game, Octocat) ->

	class Morphtocat extends Game
		constructor: (@stage) ->
			super @assets(), =>
				@init(); @gameLoop

		init: =>
			@octocat = @stage.addChildCentered new Octocat()

			keys = @stage.keys
			keys.left = => @octocat.position.x -= 3
			keys.right = => @octocat.position.x += 3
			keys.up = => @octocat.position.y -= 3
			keys.down = => @octocat.position.y += 3

		gameLoop: =>
			@stage.render()

			#código del juego

		assets: => [
				"assets/sprites/classic-octocat.json"
			]