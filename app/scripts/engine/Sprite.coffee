define ["pixi"], ->

	class Sprite extends PIXI.Sprite
		constructor: (textureUrl) ->
			texture = PIXI.Texture.fromImage textureUrl
			super texture		

		scaleTo: (proportion) =>
			@scale.x = @scale.y = proportion