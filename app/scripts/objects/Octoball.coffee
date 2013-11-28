define ["engine/Sprite", "utils/Randomizer"], (Sprite, Randomizer) ->

	class Octoball extends Sprite
		constructor: (x, y) ->
			super "octoball.png"		
			@position.x = x
			@position.y = y
			@absoluteX = x

			@anchor.x = 0.5
			@anchor.y = 0.5

			@scale.x = 0.7
			@scale.y = 0.7

		#properties
		speed: => new Randomizer(1, 5).get()
		solid: => true

		#methods
		render: =>
			@_rotateLeft()
			@position.x -= @speed()
			@absoluteX -= @speed()

		isOnPlatform: => false

		_rotateLeft: => 
			@rotation -= 0.06