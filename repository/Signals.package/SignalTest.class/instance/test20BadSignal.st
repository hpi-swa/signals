tests
test20BadSignal
	
	consumer connect: producer signal: #newSignalProducedInBlock toSelector: #toggleSwitch.
	producer produceBadSignal.
	
	self assert: #on equals: consumer switchState.