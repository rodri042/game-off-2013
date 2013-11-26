define [], ->

	class Gravity
		constructor: ->
			@resetSpeed()

		#properties
		initialSpeed: => .5

		#methods
		timeHasPassed: =>
			@actualSpeed += .01

		resetSpeed: =>
			@actualSpeed = @initialSpeed()
