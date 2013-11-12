define ["engine/MovieClip"], (MovieClip) ->

	class Transformation extends MovieClip
		constructor: (octocat, from, to) ->
			numberOfTextures = 60
			try
				super "#{from.name()}-#{to.name()}", numberOfTextures
			catch reverseSpriteError
				super "#{to.name()}-#{from.name()}", numberOfTextures, true

			@start().done => octocat.setShape to

		morphInto: (octocat, newShape) =>

		render: =>
			if (!@playing)
				@endPromise?.resolve()

		start: =>
			@play()
			@endPromise = $.Deferred()