define ["characters/Shape"], (Shape) ->

	class RainbowShape extends Shape
		name: => "rainbow"
		numberOfTextures: => 19
		jumpingSpeed: => -17
