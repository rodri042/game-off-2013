define ['utils/Game', 'characters/Octocat'], (Game, Octocat) ->

	class Morphtocat extends Game
		constructor: (@stage) ->
			super @assets(), =>
				@octocat = @stage.addChildCentered new Octocat()
				@gameLoop

		gameLoop: =>
			@stage.render()

			#código del juego

		assets: => [
				"assets/sprites/classic-octocat.json"
			]