define ["characters/Shape"], (Shape) ->

	class RainbowShape extends Shape
		#properties
		name: => "rainbow"
		numberOfTextures: => 19
		speed: => super() + 2
		jumpingSpeed: => super() - 5
