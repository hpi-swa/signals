tests
test03Signaling

	consumer connect: producer signal: #valueChanged: toSelector: #value:.
	consumer connect: producer signal: #newSignalProduced toSelector: #toggleSwitch.
	
	self
		assert: consumer value isNil;
		assert: #off equals: consumer switchState.	
	producer value: 'foobar'.
	producer produceSignal.
	self
		assert: consumer value = 'foobar';
		assert: #on equals: consumer switchState.	
	
	producer disconnectAllSignals.
	producer value: 'blubb'.
	self
		assert: consumer value = 'foobar';
		assert: #on equals: consumer switchState.