tests
test24ConnectSignalToSignal2

	consumer connect: producer signal: #valueChanged: toSelector: #valueConsumed. "#valueConsumed is a public signal."
	consumer connect: consumer signal: #valueConsumed toSelector: #toggleSwitch.
	
	self assert: #off equals: consumer switchState.
	producer value: #foobar.
	self assert: #on equals: consumer switchState.