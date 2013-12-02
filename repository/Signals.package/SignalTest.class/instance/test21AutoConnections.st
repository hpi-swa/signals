tests
test21AutoConnections
	
	| c |
	c := SignalConsumerAuto new.
	
	self
		assert: #off equals: c switchState;
		assert: nil equals: c value.
		
	c producer produceSignal; value: #foobar.
	
	self
		assert: #on equals: c switchState;
		assert: #foobar equals: c value.
		
	c producer value: #foobar and: #blubb.
	
	self
		assert: #on equals: c switchState;
		assert: #blubb equals: c value.