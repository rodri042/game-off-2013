define ["physics/Force"], (Force) ->

	class Gravity extends Force
		constructor: (@object) ->
			super()
			
		acceleration: => 1.5

		speed: =>
			if @object.isFalling
				@object.mass() * @acceleration() * @elapsedTime
			else
				0