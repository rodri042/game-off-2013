define ["utils/ArrayUtils"], ->

	class Keyboard
		constructor: (@target) ->
			@pressedKeys = []

			@_registerEvent target.keydown, (key) =>
				@pressedKeys.addIfNotExists key

			@_registerEvent target.keyup, (key) =>
				@pressedKeys.remove key

		raiseEvents: =>
			@pressedKeys.forEach (key) =>
				handler = @_keyCodeMap()[key]
				handler?()

		_registerEvent: (register, handler) =>
			register.call @target, (event) =>
				#event.preventDefault()
				handler event.which

		_keyCodeMap: =>
			map =
				9:  @tab
				13: @enter
				27: @esc
				37: @left
				38: @up
				39: @right
				40: @down

			[48..90].forEach (code) =>
				map[code] = @[String.fromCharCode(code).toLowerCase()]

			map