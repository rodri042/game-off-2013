define ['engine/Game', 'characters/Octocat'], (Game, Octocat) ->

	class Morphtocat extends Game
		constructor: (@stage) ->
			super @assets(), =>
				@init(); @gameLoop

		init: =>
			@octocat = @stage.addChildCentered new Octocat()

			@stage.keys.left = =>
				alert "Tocaste la flecha izquierda"

		gameLoop: =>
			@stage.render()

			#código del juego

		assets: => [
				"assets/sprites/classic-octocat.json"
			]