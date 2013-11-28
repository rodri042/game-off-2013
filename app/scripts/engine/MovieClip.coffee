define ["pixi", "utils/NumberUtils"], (PIXI) ->

	class MovieClip extends PIXI.MovieClip
		constructor: (name, numberOfTextures, reverse) ->
			indexes = [1..numberOfTextures]
			if (reverse) then indexes.reverse()

			textures = indexes
				.map (index) => PIXI.Texture.fromFrame "#{name}#{index.toStringWithMinimumLength 4}.png"
			super textures

			@anchor.x = 0.5
			@loop = false
