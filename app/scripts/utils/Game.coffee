define ['pixi'], ->

	class Game
		constructor: (@render) ->

		start: =>
			gameLoop = =>
			  requestAnimFrame gameLoop
			  @render()

			requestAnimFrame gameLoop