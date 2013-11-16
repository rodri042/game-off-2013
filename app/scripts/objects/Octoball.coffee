define ["pixi", "utils/Randomizer"], (_, Randomizer) ->

	class Octoball extends PIXI.Sprite
		constructor: ->
			texture = PIXI.Texture.fromImage("../assets/sprites/octoball.png")
			super texture		

			@anchor.x = 0.5
			@anchor.y = 0.5

			@_randomizeSpeed()

		#methods
		render: =>
			@_rotateLeft()
			@_move()		

		flip: (coordinate) => 
			@speed[coordinate] *= -1
			
		_randomizeSpeed: =>
			randomizer = new Randomizer -10, 10
			@speed =
				x: randomizer.get()
				y: randomizer.get()

		_rotateLeft: => 
			@rotation -= 0.06

		_move: =>
			@position.x += @speed.x
			@position.y += @speed.y

			if @stage.collidesOnLeft(@) || @stage.collidesOnRight(@)
				@flip 'x'

			if @stage.collidesOnTop(@) || @stage.collidesOnBottom(@)
				@flip 'y'