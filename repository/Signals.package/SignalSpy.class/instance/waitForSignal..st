waiting
waitForSignal: aSignal

	| signal |
	[signal notNil and: [signal first = aSignal]]
		whileFalse: [signal := self queue next].
		
	^ signal