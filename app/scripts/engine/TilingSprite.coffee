define ["pixi"], ->

	class TilingSprite extends PIXI.TilingSprite
		constructor: (textureName, width, height) ->
			texture = PIXI.Texture.fromFrame textureName
			super texture, width, height