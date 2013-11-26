define ["engine/MovieClip", "engine/Jukebox", "jquery"], (MovieClip, Jukebox, $) ->

	class Transformation extends MovieClip
		constructor: (octocat, @from, @to) ->
			numberOfTextures = 60
			try
				super "#{from.name()}-#{to.name()}", numberOfTextures
			catch reverseSpriteError
				super "#{to.name()}-#{from.name()}", numberOfTextures, true

			@_beginTransformation().done => octocat.setShape to

		#properties
		speed: => @from.speed()
		jumpingSpeed: => @from.jumpingSpeed()

		#methods
		morphInto: (octocat, newShape) => # you can't morph to another shape right now!

		render: =>
			if (!@playing)
				@endPromise?.resolve()

		_beginTransformation: =>
			@play()
			Jukebox.play "octocat/morph"
			@endPromise = $.Deferred()
