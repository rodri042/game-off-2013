define [], ->

	Number::toStringWithMinimumLength = (minimumLength) ->
	  n = Math.abs(this)
	  zeros = Math.max(0, minimumLength - Math.floor(n).toString().length)
	  zeroString = Math.pow(10, zeros).toString().substr(1)
	  zeroString = "-" + zeroString  if this < 0
	  zeroString + n