define ["engine/Sprite"], (Sprite) ->

	class World extends Sprite
		constructor: ->
			super "../assets/world/night.jpg"
			@scaleTo .8