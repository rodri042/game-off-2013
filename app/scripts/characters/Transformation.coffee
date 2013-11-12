define ["engine/MovieClip"], (MovieClip) ->

	class Transformation extends MovieClip
		constructor: (from, to) ->
			numberOfTextures = 60
			try
				super "#{from}-#{to}", numberOfTextures
			catch reverseSpriteError
				super "#{to}-#{from}", numberOfTextures, true

			@play()

		render: =>
			if (!@playing)
				@endPromise?.resolve()

		start: =>
			@play()
			@endPromise = $.Deferred()