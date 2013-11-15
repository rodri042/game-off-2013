define ["utils/ArrayUtils"], ->

	class Keyboard
		constructor: (@target) ->
			@_generateKeyCodeMap()
			@pressedKeys = []

			@_registerEvent target.keydown, (key) =>
				@pressedKeys.addIfNotExists key

			@_registerEvent target.keyup, (key) =>
				@pressedKeys.remove key

		raiseEvents: =>
			@pressedKeys.forEach (key) =>
				@_getHandlerFor(key)?()

		_registerEvent: (register, pressingHandler) =>
			_this = @
			register.call @target, (event) =>
				key = event.which
				handler = @_getHandlerFor key

				if handler?
					event.preventDefault()
					pressingHandler key

		_getHandlerFor: (key) =>
			_this = @
			eval """_this["#{@keyCodeMap[key]}"]"""

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