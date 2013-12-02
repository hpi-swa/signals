tests
test17ConnectSignalToSignal

	producer connect: producer signal: #valueChanged: toSelector: #newSignalProduced.
	consumer connect: producer signal: #newSignalProduced toSelector: #toggleSwitch.
	
	self assert: #off equals: consumer switchState.
	producer value: #foobar.
	self assert: #on equals: consumer switchState.