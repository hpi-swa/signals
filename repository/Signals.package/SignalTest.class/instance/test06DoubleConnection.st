tests
test06DoubleConnection

	consumer connect: producer signal: #valueChanged: toSelector: #value:.
	consumer connect: producer signal: #valueChanged: toSelector: #toggleSwitch pattern: #().
	
	self
		assert: consumer value isNil;
		assert: #off equals: consumer switchState.	
	
	producer value: 'foobar'.
	
	self
		assert: consumer value = 'foobar';
		assert: #on equals: consumer switchState.	