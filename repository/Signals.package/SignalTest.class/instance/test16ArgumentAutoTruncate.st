tests
test16ArgumentAutoTruncate

	consumer connect: producer signal: #valueChanged: toSelector: #toggleSwitch.
	
	self assert: #off equals: consumer switchState.
	producer value: #foobar.
	self assert: #on equals: consumer switchState.