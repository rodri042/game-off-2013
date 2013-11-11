define ["pixi", "utils/NumberUtils"], ->

	class MovieClip extends PIXI.MovieClip
		constructor: (name, numberOfTextures) ->
			textures = [1..numberOfTextures]
				.map (index) => PIXI.Texture.fromFrame "#{name}#{index.toStringWithMinimumLength 4}.png"
			super textures

			@anchor.x = 0.5
			@anchor.y = 0.5
			@loop = false