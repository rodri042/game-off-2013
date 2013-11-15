define ['pixi'], ->

	class Sprite extends PIXI.Sprite
		constructor: (textureFile) ->
			texture = PIXI.Texture.fromImage textureFile
			super texture
