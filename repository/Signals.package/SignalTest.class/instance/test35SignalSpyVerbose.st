as yet unclassified
test35SignalSpyVerbose

	| spy stm dbgFirst dbgSecond |
	[
	spy := SignalSpy onSender: producer signal: #valueChanged:.
	spy verbose: true.
	
	stm := SignalTranscriptModel new register.
	
	producer value: #DontSpyOnMe.	
	
	dbgFirst := stm lastUpdate.
	dbgSecond := stm lastEntry withBlanksTrimmed.
   7/0.
	Transcript cr; show: '[DBG] ', dbgFirst.
	Transcript cr; show: '[DBG] ', dbgSecond.
	
	self
		assert: #appendEntry equals: dbgFirst;
		assert: '#(#valueChanged: #(#DontSpyOnMe))' equals: dbgSecond.
	
	stm unregister.
	] on: Error do: [:err | Transcript cr; show: '[ERROR] ', err description]