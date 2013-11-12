define [], ->

	class Force
		constructor: (@initialSpeed) ->
			@resetTime()

		resetTime: => @elapsedTime = 0
		timeHasPassed: => @elapsedTime++

		speed: => 
			if @elapsedTime < 20
				@initialSpeed
			else
				0