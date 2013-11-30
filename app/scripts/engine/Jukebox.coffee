define ["buzz"], (buzz) ->

	class Jukebox
		@getInstance = ->
			if !@instance?
				@instance = new Jukebox()

			@instance

		sounds: => [
			"octocat/jump"
			"octocat/morph"
		]

		init: => @sounds().forEach (it) => @createSound it

		createSound: (aSoundName) =>
			new buzz.sound "../assets/sounds/#{aSoundName}",
				formats: ["ogg", "mp3"]
				preload: true

		play: (aSoundName) =>
			@createSound(aSoundName).play()
