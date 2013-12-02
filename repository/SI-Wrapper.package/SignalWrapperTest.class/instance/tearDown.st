running
tearDown

	super tearDown.
	Smalltalk garbageCollect.
	Processor yield.