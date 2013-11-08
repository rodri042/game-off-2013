class Randomizer
	constructor: (@min, @max) ->

	get: =>
  		Math.floor Math.random() * (@max - @min + 1) + @min

class Stage extends PIXI.Stage
	WIDTH = 1000
	HEIGHT = 600

	constructor: ->
		super 0xFFFFFF
		@renderer = PIXI.autoDetectRenderer WIDTH, HEIGHT

	center: (anObject) =>
		anObject.position.x = @width() / 2
		anObject.position.y = @height() / 2

	width: -> @renderer.width
	height: -> @renderer.height		

	render: =>
		@children.forEach (it) -> it.render()
		@renderer.render @

	addChildCentered: (aChild) =>
		@center aChild
		@addChild aChild
		aChild

	collidesOnLeft: (anObject) =>
		anObject.position.x - anObject.width / 2 < @position.x

	collidesOnTop: (anObject) =>
		anObject.position.y - anObject.width / 2 < @position.y

	collidesOnBottom: (anObject) =>
		anObject.position.y + anObject.width / 2 > @position.y + @height()

	collidesOnRight: (anObject) =>
		anObject.position.x + anObject.width / 2 > @position.x + @width()

	view: => @renderer.view

	onClick: (action) =>
		$(@view()).click action

class Octocat extends PIXI.Sprite
	constructor: ->
		texture = PIXI.Texture.fromImage("../assets/sprites/octocat.png")
		super texture		

		# rotate around center
		@anchor.x = 0.5
		@anchor.y = 0.5

		@randomizeSpeed()

	randomizeSpeed: =>
		randomizer = new Randomizer -10, 10
		@speed =
			x: randomizer.get()
			y: randomizer.get()

	rotateLeft: => 
		@rotation -= 0.06

	move: =>
		@position.x += @speed.x
		@position.y += @speed.y

		if @stage.collidesOnLeft(@) || @stage.collidesOnRight(@)
			@flip 'x'

		if @stage.collidesOnTop(@) || @stage.collidesOnBottom(@)
			@flip 'y'

	flip: (coordinate) => 
		@speed[coordinate] *= -1

	render: ->
		@rotateLeft()
		@move()		

class Game
	constructor: (@render) ->

	start: =>
		gameLoop = =>
		  requestAnimFrame gameLoop
		  @render()

		requestAnimFrame gameLoop			

class Counter extends PIXI.Text
	constructor: (@elements, @label) ->
		super label, fill: "black"
		@position.x = @position.y = 8

	count: => @elements.length		

	render: => @setText @label + @count()

stage = new Stage()
stage.onClick -> octocats.push stage.addChildCentered(new Octocat())

document.getElementById("game").appendChild stage.view()

octocats = [ stage.addChildCentered new Octocat() ]

ballsCounter = new Counter octocats, "Octocats: "
stage.addChild ballsCounter

new Game( -> stage.render()).start()
