define ["utils/ArrayUtils"], ->

	class Keyboard
		constructor: (@target) ->
			@_generateKeyCodeMap()
			@_generateKnownKeys()
			@pressedKeys = []

			@_registerEvent target.keydown, (key) =>
				@pressedKeys.addIfNotExists key

			@_registerEvent target.keyup, (key) =>
				@pressedKeys.remove key

		raiseEvents: =>
			_this = @
			@pressedKeys.forEach (key) =>
				handler = eval "_this.#{@keyCodeMap[key]}"
				handler?()

		_registerEvent: (register, handler) =>
			register.call @target, (event) =>
				key = event.which
				if @knownKeys.contains key.toString()
					event.preventDefault()
					handler key

		_generateKeyCodeMap: =>
			@keyCodeMap =
				9:  "tab"
				13: "enter"
				27: "esc"
				37: "left"
				38: "up"
				39: "right"
				40: "down"

			[48..90].forEach (code) =>
				@keyCodeMap[code] = String.fromCharCode(code).toLowerCase()

		_generateKnownKeys: =>
			@knownKeys = []
			for index of @keyCodeMap
				@knownKeys.push index