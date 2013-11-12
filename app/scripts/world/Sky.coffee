define ["engine/Sprite"], (Sprite) ->

	class Sky extends Sprite
		constructor: (@octocat) ->
			super "../assets/world/night.jpg"
			@scaleTo .8