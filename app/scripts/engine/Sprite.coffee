define ["pixi"], ->

	class Sprite extends PIXI.Sprite
		constructor: (textureName) ->
			texture = PIXI.Texture.fromImage textureName
			super texture
