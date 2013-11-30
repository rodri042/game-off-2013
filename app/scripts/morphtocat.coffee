define ["engine/Game", "characters/ClassicShape", "characters/RainbowShape", "characters/DojocatShape", "world/LoseScreen", "world/Counter", "engine/Jukebox", "pixi"],
(Game, ClassicShape, RainbowShape, DojocatShape, LoseScreen, Counter, Jukebox) ->

	class Morphtocat extends Game
		constructor: (@world) ->
			super @assets(), =>
				@init(); @gameLoop

		#properties
		assets: => [
			"assets/sprites/classic.json"
			"assets/sprites/rainbow.json"
			"assets/sprites/dojocat.json"
			"assets/sprites/classic-rainbow.json"
			"assets/sprites/classic-dojocat.json"
			"assets/sprites/rainbow-dojocat.json"
			"assets/sprites/octoball.json"
			"assets/world/night-long.json"
			"assets/world/platform.json"
			"assets/world/ruby-platform.json"
			"assets/world/parallaxcat.json"
			"assets/world/desert.json"
		]

		#methods
		init: =>
			Morphtocat.Speed = 0

			Jukebox.getInstance().init()
			@octocat = @world.init()

			@_bindKeys()

			@world.addChild new PIXI.Text("Avoid the Octoballs!\nPress Q, W, E to morph in another Octocat...", { fill: "black", font: "18px Calibri" })
			@score = @world.addChild new Counter(@world.sky)

		gameLoop: =>
			@world.render()

			if @died then return
			@_checkIfIsOutOfScreen()
			@_checkIfEatsAnOctoball()

			@_increaseGlobalSpeed()

		_checkIfIsOutOfScreen: =>
			if @octocat.position.x + @octocat.width() / 2 < 0
				@_endGame()

		_checkIfEatsAnOctoball: =>
			collides = @world.staticObjects.findOne((it) =>
				tolerance = 15

				collidesOnX = it.absoluteX - it.width  + tolerance <= @octocat.absoluteX <= it.absoluteX + it.width - tolerance
				collidesOnY =  it.position.y - it.height + tolerance <= @octocat.position.y + @octocat.height() / 2 <= it.position.y + it.height - tolerance
				collidesOnX and collidesOnY and it.solid?
			)?
			if collides then @_endGame()

		_endGame: =>
			@died = true
			@world.clear()
			@score.freeze()
			@world.addChild new LoseScreen()
			@world.addChild @score
			@world.keys.enter = =>
				@world.keys.enter = => #avoid double enter
				window.resetGame()

		_increaseGlobalSpeed: => Morphtocat.Speed += .0075

		_bindKeys: =>
			keys = @world.keys
			keys.left = => @octocat.moveLeft()
			keys.right = => @octocat.moveRight()
			keys.down = =>
			keys.up = =>
			keys.q = => @octocat.morph new ClassicShape()
			keys.w = => @octocat.morph new RainbowShape()
			keys.e = => @octocat.morph new DojocatShape()
			keys.space = => @octocat.jump()
