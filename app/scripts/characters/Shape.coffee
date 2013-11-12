define ["engine/MovieClip"], (MovieClip) ->

	class Shape extends MovieClip
		constructor: ->
			super @name(), @numberOfTextures()

		move: =>
			if (!@playing)
				@gotoAndPlay 0

		#<<template method>>
		numberOfTextures: =>