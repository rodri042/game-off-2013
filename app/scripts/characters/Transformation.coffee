define ["engine/MovieClip", "engine/Jukebox", "jquery", "pixi"], (MovieClip, Jukebox, $) ->

	class Transformation extends MovieClip
		constructor: (octocat, @from, @to) ->
			numberOfTextures = 60
			try
				super "#{from.name()}-#{to.name()}", numberOfTextures
			catch reverseSpriteError
				super "#{to.name()}-#{from.name()}", numberOfTextures, true

			@alpha = .5
			@_beginTransformation().done =>
				@alpha = 1
				octocat.setShape to

		#properties
		speed: => @to.speed()
		jumpingSpeed: => @to.jumpingSpeed()

		#methods
		morphInto: (octocat, newShape) => # you can't morph to another shape right now!

		render: =>
			if (!@playing)
				@endPromise?.resolve()

		_beginTransformation: =>
			@play()
			Jukebox.play "octocat/morph"
			@endPromise = $.Deferred()