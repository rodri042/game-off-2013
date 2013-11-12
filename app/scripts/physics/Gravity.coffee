define [], ->

	class Gravity
		constructor: (@objectMass) ->
			@resetTime()

		acceleration: => 2

		resetTime: => @elapsedTime = 0

		timeHasPassed: => @elapsedTime++

		speed: ->
			@objectMass * @acceleration() * @elapsedTime