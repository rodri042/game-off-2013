define ["engine/MovieClip"], (MovieClip) ->

	class Shape extends MovieClip
		constructor: ->
			@name = @constructor.name
				.replace("Shape", "")
				.toLowerCase()
				
			super @name, @numberOfTextures()

		move: =>
			if (!@playing)
				@gotoAndPlay 0

		#<<template method>>
		numberOfTextures: =>