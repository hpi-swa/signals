tests
test35SignalSpyVerboseMode

	| spy stm |
	spy := SignalSpy onSender: producer signal: #valueChanged:.
	spy verbose: true.
	
	stm := SignalTranscriptModel new register.
	
	producer value: #DontSpyOnMe.	
	
	self
		assert: #appendEntry equals: stm lastUpdate;
		assert: String cr, '#(#valueChanged: #(#DontSpyOnMe))' equals: stm lastEntry.
	
	stm unregister.