define ["characters/Shape"], (Shape) ->

	class RainbowShape extends Shape
		#properties
		name: => "rainbow"
		numberOfTextures: => 19
		jumpingSpeed: => -17
