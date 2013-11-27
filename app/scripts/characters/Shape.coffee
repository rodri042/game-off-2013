define ["engine/MovieClip", "characters/Transformation"], (MovieClip, Transformation) ->

	class Shape extends MovieClip
		constructor: ->
			super @name(), @numberOfTextures()

		#properties
		speed: => 3
		jumpingSpeed: => -16

		#methods
		move: =>
			if (!@playing)
				@gotoAndPlay 0

		morphInto: (octocat, newShape) =>
			if (@equals newShape) then return
			octocat.setShape new Transformation(octocat, @, newShape)

		equals: (anotherShape) =>
			@name() == anotherShape.name()

		#<<template method>>
		name: =>

		#<<template method>>
		numberOfTextures: =>
