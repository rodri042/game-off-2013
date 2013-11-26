define ["engine/Sprite", "pixi"], (Sprite) ->

	class LoseScreen extends Sprite
		constructor: ->
			super "desert.png"

			@cat = new Sprite("parallaxcat.png")
			@cat.anchor.x = @cat.anchor.y = 0.5
			@cat.position.x = @width / 2
			@cat.position.y = @height / 2
			@addChild @cat

			message = new PIXI.Text "You lose", fill: "black"
			message.position.x = @width / 2 - message.width / 2
			message.position.y = @height / 2 - @cat.height / 2 - 50
			@addChild message

		render: =>
			@cat.rotation += .001