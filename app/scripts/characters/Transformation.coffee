define ["engine/MovieClip", "jquery"], (MovieClip, $) ->

	class Transformation extends MovieClip
		constructor: (octocat, @from, @to) ->
			numberOfTextures = 60
			try
				super "#{from.name()}-#{to.name()}", numberOfTextures
			catch reverseSpriteError
				super "#{to.name()}-#{from.name()}", numberOfTextures, true

			@_beginTransformation().done => octocat.setShape to

		morphInto: (octocat, newShape) => # you can't morph to another shape right now!

		jumpingSpeed: => @from.jumpingSpeed()

		render: =>
			if (!@playing)
				@endPromise?.resolve()

		_beginTransformation: =>
			@play()
			@endPromise = $.Deferred()
