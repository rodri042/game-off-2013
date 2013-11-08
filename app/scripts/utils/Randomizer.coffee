define [], ->

	class Randomizer
		constructor: (@min, @max) ->

		get: =>
	  		Math.floor Math.random() * (@max - @min + 1) + @min