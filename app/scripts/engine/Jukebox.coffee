define ["buzz"], (buzz) ->

	class Jukebox
		@play: (aSoundName) =>
			aSound = new buzz.sound "../assets/sounds/#{aSoundName}",
				formats: ["ogg", "mp3"]

			aSound.play()
