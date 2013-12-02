tests
test22AutoConnectionsTwo
	
	| c |
	c := SignalConsumerAuto new.
	
	self assert: #off equals: c switchState.
		
	c producerTwo produceSignal.
	
	self assert: #on equals: c switchState.