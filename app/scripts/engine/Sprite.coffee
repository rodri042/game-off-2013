define ["pixi"], ->

	class Sprite extends PIXI.Sprite
		constructor: (textureName) ->
			texture = PIXI.Texture.fromFrame textureName
			super texture
