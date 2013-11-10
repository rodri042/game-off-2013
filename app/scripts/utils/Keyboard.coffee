define [], ->

	class Keyboard
		constructor: (target) ->
			target.keydown (event) =>
				handler = @_keyCodeMap()[event.which]
				if handler?
					event.preventDefault()
					handler()

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