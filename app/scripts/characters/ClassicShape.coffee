define ["characters/Shape"], (Shape) ->

	class ClassicShape extends Shape
		#properties
		name: => "classic"
		numberOfTextures: => 19
		jumpingSpeed: => -15
