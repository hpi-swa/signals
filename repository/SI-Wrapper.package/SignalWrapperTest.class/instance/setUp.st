running
setUp

	super setUp.
	Smalltalk garbageCollect.
	Processor yield.