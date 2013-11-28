define ["characters/Shape"], (Shape) ->

	class DojocatShape extends Shape
		#properties
		name: => "dojocat"
		numberOfTextures: => 19
		speed: => super() + 20
		jumpingSpeed: => super() + 10