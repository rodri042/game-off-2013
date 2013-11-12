define ["engine/MovieClip", "characters/Transformation"], (MovieClip, Transformation) ->

	class Shape extends MovieClip
		constructor: ->
			super @name(), @numberOfTextures()

		move: =>
			if (!@playing)
				@gotoAndPlay 0

		morphInto: (octocat, newShape) =>
			if (@equals newShape) then return

			octocat.transformingTo = newShape

			transformation = new Transformation(@name(), newShape.name())

			octocat._changeShape transformation

			transformation.start()
				.done => octocat.finishTransformation()

		equals: (anotherShape) =>
			@name() == anotherShape.name()

		#<<template method>>
		numberOfTextures: =>