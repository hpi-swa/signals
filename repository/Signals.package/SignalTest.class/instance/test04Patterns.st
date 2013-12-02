tests
test04Patterns

	consumer connect: producer signal: #valueChanged: toSelector: #toggleSwitch pattern: #().
	
	self assert:#off equals: consumer switchState.	
	producer value: 'foobar'.
	self assert:#on equals: consumer switchState.	