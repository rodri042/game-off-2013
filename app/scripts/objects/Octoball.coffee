define ["engine/Sprite", "utils/Randomizer", "morphtocat"], (Sprite, Randomizer, Morphtocat) ->

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
		speed: => Morphtocat.Speed + new Randomizer(1, 5).get()

		#methods
		render: =>
			@_rotateLeft()
			@position.x -= @speed()

		_rotateLeft: => 
			@rotation -= 0.06

		isOnPlatform: => false