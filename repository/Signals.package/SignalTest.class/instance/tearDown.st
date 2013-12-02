running
tearDown

	super tearDown.
	(process notNil and: [process isTerminated not]) ifTrue: [process terminate].