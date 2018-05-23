spying
doesNotUnderstand: aMessage

	| item |
	item := {aMessage selector. aMessage arguments}.
	self queue nextPut: item.

	self verbose ifTrue: [
		Transcript
			cr;
			show: item asString].