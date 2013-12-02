spying
doesNotUnderstand: aMessage

	self queue nextPut: {aMessage selector. aMessage arguments}.

	self verbose ifTrue: [
		Transcript
			cr;
			show: {aMessage selector. aMessage arguments}].