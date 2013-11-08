define ['pixi', 'utils/Randomizer'], (_, Randomizer) ->

	class Octocat extends PIXI.Sprite
		constructor: ->
			texture = PIXI.Texture.fromImage("../assets/sprites/octocat.png")
			super texture		

			# rotate around center
			@anchor.x = 0.5
			@anchor.y = 0.5

			@randomizeSpeed()

		randomizeSpeed: =>
			randomizer = new Randomizer -10, 10
			@speed =
				x: randomizer.get()
				y: randomizer.get()

		rotateLeft: => 
			@rotation -= 0.06

		move: =>
			@position.x += @speed.x
			@position.y += @speed.y

			if @stage.collidesOnLeft(@) || @stage.collidesOnRight(@)
				@flip 'x'

			if @stage.collidesOnTop(@) || @stage.collidesOnBottom(@)
				@flip 'y'

		flip: (coordinate) => 
			@speed[coordinate] *= -1

		render: ->
			@rotateLeft()
			@move()		
