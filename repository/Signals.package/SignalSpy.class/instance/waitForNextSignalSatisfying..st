waiting
waitForNextSignalSatisfying: aBlock

	| signal |
	[signal := self queue next. aBlock value: signal]
		whileFalse.
	^ signal