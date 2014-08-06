define ["utils/ArrayUtils"], ->

	class Keyboard
		constructor: (@target) ->
			@_generateKeyCodeMap()
			@pressedKeys = []

			@_on(target.keydown).do (key) =>
				@pressedKeys.addIfNotExists key

			@_on(target.keyup).do (key) =>
				@pressedKeys.remove key

		#methods
		raiseEvents: =>
			@pressedKeys.forEach (key) =>
				@_getHandlerFor(key)?()

		_on: (eventType) =>
			do: (action) =>
				eventType.call @target, (event) =>
					key = event.which
					handler = @_getHandlerFor key

					if handler?
						event.preventDefault()
						action key

		_getHandlerFor: (key) => @[@keyCodeMap[key]]

		_generateKeyCodeMap: =>
			@keyCodeMap =
				9:  "tab"
				13: "enter"
				27: "esc"
				32: "space"
				37: "left"
				38: "up"
				39: "right"
				40: "down"

			[48..90].forEach (code) =>
				@keyCodeMap[code] = String.fromCharCode(code).toLowerCase()
