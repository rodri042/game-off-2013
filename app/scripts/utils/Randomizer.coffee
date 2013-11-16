define [], ->

	class Randomizer
		constructor: (@min, @max) ->

		#methods
		get: =>
	  		Math.floor Math.random() * (@max - @min + 1) + @min