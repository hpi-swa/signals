tests
test35SignalSpyVerboseMode

	| spy stm |
	
	spy := SignalSpy onSender: producer signal: #valueChanged:.
	spy verbose: true.
	
	stm := SignalTranscriptModel new register.
	
	producer value: #DontSpyOnMe.	
	
	self assert: stm lastUpdate notNil.
	self assert: (stm lastUpdate beginsWith: #appendEntry).
	self assert: '#(#valueChanged: #(#DontSpyOnMe))' equals: stm lastEntry withBlanksTrimmed.
	
	stm unregister.
