define ["characters/Shape"], (Shape) ->

	class RainbowShape extends Shape
		#properties
		name: => "rainbow"
		numberOfTextures: => 19
		speed: => super() + 1
		jumpingSpeed: => super() - 5
