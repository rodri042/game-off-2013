define [], ->

	class Gravity
		constructor: (@objectMass) ->
			@elapsedTime = 0

		acceleration: => 2

		timeHasPassed: => @elapsedTime++

		speed: ->
			@objectMass * @acceleration() * @elapsedTime