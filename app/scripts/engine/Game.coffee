define ["pixi"], ->

	class Game
		constructor: (assetsToLoad, init) ->
			loader = new PIXI.AssetLoader assetsToLoad
			loader.onComplete = => 
				render = init()  
				@start render
				
			loader.load()

		#methods
		start: (render) =>
			gameLoop = =>
			  requestAnimFrame gameLoop
			  render()

			requestAnimFrame gameLoop