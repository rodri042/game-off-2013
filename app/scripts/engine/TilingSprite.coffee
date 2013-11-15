define ["pixi"], ->

	class TilingSprite extends PIXI.TilingSprite
		constructor: (textureUrl, width, height) ->
			texture = PIXI.Texture.fromImage textureUrl
			super texture, width, height