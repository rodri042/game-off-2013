define ["engine/MovieClip"], (MovieClip) ->

	class Transformation extends MovieClip
		constructor: (from, to) ->	
			super "#{from}-#{to}", 60
			@play()

		render: =>
			if (!@playing)
				@endPromise?.resolve()

		start: =>
			@play()
			@endPromise = $.Deferred()